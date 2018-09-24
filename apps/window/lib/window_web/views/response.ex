defmodule WindowWeb.Response do

  def response(data, errors \\ nil) do
    %{
      meta: %{
        errors: errors
      },
      data: data
    }
  end

end
