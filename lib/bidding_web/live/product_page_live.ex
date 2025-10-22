defmodule BiddingWeb.ProductPageLive do
  use BiddingWeb, :live_view

  def render(assigns) do
    ~H"""
    <main class="max-w-[1200px] mx-auto mt-20">
      <%= for product <- @products do %>
        <div class="grid grid-cols-[2fr_1fr] mb-9" data-product-id={product.id}>
          <div class="mx-auto max-w-[500px] min-h-[350px] flex">
            <img class="max-w-full h-auto" src={product.main_image_url} />
          </div>

          <div class="flex flex-col items-center justify-center text-sm">
            <h4 class="m-0 text-lg font-semibold">{product.name}</h4>

            <div>by {product.brand}</div>
            <div>{product.color}</div>
            <div>${product.price_usd}</div>

            <%= if product.released do %>
              <form class="grid grid-cols-4 gap-2 mt-6">
                <%= for size <- product_size_options(product) do %>
                  <button
                    type="submit"
                    class={[
                      "h-12 w-12 flex items-center justify-center border border-gray-600 m-1",
                      "hover:bg-gray-600 hover:text-white hover:cursor-pointer",
                      level_class(size.level)
                    ]}
                    name="item_id"
                    value={size.id}
                    disabled={size.disabled?}
                  >
                    {size.text}
                  </button>
                <% end %>
              </form>
            <% else %>
              <h4 class="product-soon-#{@product.id}">
                coming soon...
              </h4>
            <% end %>
          </div>
        </div>
      <% end %>
    </main>
    """
  end

  defp level_class("medium"), do: "border-[#FFB347] hover:bg-[#FFB347]"
  defp level_class("low"), do: "border-[#FF6961] hover:bg-[#FF6961]"
  defp level_class("out"), do: "border-none text-gray-400 line-through cursor-not-allowed"
  defp level_class(_), do: ""

  def mount(_, _, socket) do
    {:ok, assign(socket, products: dummy_products())}
  end

  def product_size_options(product) do
    product.items
    |> Enum.map(fn item ->
      %{
        text: item.size,
        id: item.id,
        level: availability_to_level(item.available_count),
        disabled?: item.available_count == 0
      }
    end)
  end

  def availability_to_level(count) when count == 0, do: "out"
  def availability_to_level(count) when count < 150, do: "low"
  def availability_to_level(count) when count < 500, do: "medium"
  def availability_to_level(_), do: "high"

  def dummy_products() do
    [
      %{
        id: 1,
        sku: "SHU6000",
        brand: "Snks 23",
        name: "Hop Man 3",
        color: "yellow/blue",
        main_image_url: ~p"/images/hopman.png",
        price_usd: 120,
        released: true,
        items: mock_items("SHU6000")
      },
      %{
        id: 2,
        sku: "SHU6100",
        brand: "Asler",
        name: "Breezy Boost 600",
        color: "momentum",
        main_image_url: ~p"/images/breezy.png",
        price_usd: 140,
        released: false,
        items: mock_items("SHU6100")
      }
    ]
  end

  defp mock_items("SHU6000") do
    sizes = %{
      "SHU6001" => "6",
      "SHU6002" => "6.5",
      "SHU6003" => "7",
      "SHU6004" => "7.5",
      "SHU6005" => "8",
      "SHU6006" => "8.5",
      "SHU6007" => "9",
      "SHU6008" => "9.5",
      "SHU6009" => "10",
      "SHU6010" => "10.5",
      "SHU6011" => "11",
      "SHU6012" => "11.5",
      "SHU6013" => "12"
    }

    build_mock_items(sizes)
  end

  defp mock_items("SHU6100") do
    sizes = %{
      "SHU6101" => "6",
      "SHU6102" => "6.5",
      "SHU6103" => "7",
      "SHU6104" => "7.5",
      "SHU6105" => "8",
      "SHU6106" => "8.5",
      "SHU6107" => "9",
      "SHU6108" => "9.5",
      "SHU6109" => "10",
      "SHU6110" => "10.5",
      "SHU6111" => "11",
      "SHU6112" => "11.5",
      "SHU6113" => "12"
    }

    build_mock_items(sizes)
  end

  defp build_mock_items(sizes) do
    Enum.with_index(sizes)
    |> Enum.map(fn {{sku, size}, index} ->
      %{
        id: index + 1,
        sku: sku,
        size: size,
        available_count: random_availability()
      }
    end)
  end

  defp random_availability() do
    # 10% chance of being sold out
    if :rand.uniform() < 0.1 do
      0
    else
      :rand.uniform(1000) + 200
    end
  end
end
