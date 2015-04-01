Rails.configuration.stripe = {
  :publishable_key => 'pk_test_To6xtnnLr2Ns3JUAwb5RkDK8',
  :secret_key      => 'sk_test_HJ91GiwLBtPIB0XCF7udse0k'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]