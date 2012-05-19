module ShtHelper
  def product_template_sht(product)
    {
      url: sht_url(product),
      title: product.title,
      price: number_to_currency(product.price),
      description: product.description
    }
  end
end
