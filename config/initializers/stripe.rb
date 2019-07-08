if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_snzlgRxpZ6lIcvTydfarJyQO00H13AzUYU',
    secret_key: 'sk_test_8n926AMsKZvxqavS25koiDwU00xb1NQUo9'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
