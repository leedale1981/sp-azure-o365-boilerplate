using System;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Host;

namespace ApplyPnPProvisioningTemplate
{
    public static class ApplyPnPTemplate
    {
        [FunctionName("ApplyPnPTemplate")]
        public static void Run([QueueTrigger("pnpprovisioningqueue", Connection = "AzureQueueConnection")]string myQueueItem, TraceWriter log)
        {
            log.Info($"C# Queue trigger function processed: {myQueueItem}");

            Environment.
        }
    }
}
