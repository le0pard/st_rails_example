module ProductsHelper
  def product_template_data(product)
    {
      url: product_url(product),
      title: product.title,
      price: number_to_currency(product.price),
      description: product.description
    }
  end
end
