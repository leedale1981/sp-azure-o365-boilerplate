using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;
using Microsoft.SharePoint.Client;
using OfficeDevPnP.Core;
using OfficeDevPnP.Core.Framework.Provisioning.Model;
using OfficeDevPnP.Core.Framework.Provisioning.Providers.Xml;
using System;

namespace ApplyPnPProvisioningTemplate
{
    public static class ApplyPnPTemplate
    {
        [FunctionName("ApplyPnPTemplate")]
        public static void Run([QueueTrigger("pnpprovisioningqueue", Connection = "AzureQueueConnection")]string siteUrl, TraceWriter log)
        {
            log.Info($"Azure Function Queue Item - Applying PnP Template to site: {siteUrl}");

            string appId = Environment.GetEnvironmentVariable("AppClientID");
            string appSecret = Environment.GetEnvironmentVariable("AppClientSecret");

            AuthenticationManager authManager = new AuthenticationManager();

            using (var clientContext = authManager.GetAppOnlyAuthenticatedContext(siteUrl, appId, appSecret))
            {
                string templatePath = @"D:\home\site\wwwroot\ApplyPnPTemplate\";
                XMLFileSystemTemplateProvider provider = new XMLFileSystemTemplateProvider(templatePath, "");
                ProvisioningTemplate template = provider.GetTemplate("FlowDemoTemplate.xml");

                clientContext.Web.ApplyProvisioningTemplate(template);
            }
        }
    }
}
