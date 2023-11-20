

resource "kubernetes_secret" "k8sgpt-sample-secret" {
  metadata  { 
     name   		= "k8sgpt-sample-secret"
     namespace		= var.namespace-monitoramento
   }
   
   data = { 
     openai-api-key	= "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"
   }

   type			= "Opaque"
}
