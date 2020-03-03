Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_VTfwRTH1s5Rm2CBuV7TRxzT900w5C6D6vH'],
  secret_key:      ENV['sk_test_i4YJNts64ENuCB97fX1anUYM00InbuB18s']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
