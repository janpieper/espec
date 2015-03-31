defmodule ESpec.Assertions.MatchSpec do

  use ESpec

  describe "ESpec.Assertions.Match" do

    context "Success" do
      it do: expect("abcd").to match(~r/c(d)/)
      it do: expect("abcd").to match("bc")
      it do: expect("abcd").to_not match(~r/e/)
      it do: expect("abcd").to_not match("ad")

      it do: expect({1, _}).to match({1, 2})
     
    end

    xcontext "Errors" do
      it do: expect("abcd").to_not match(~r/c(d)/)
      it do: expect("abcd").to_not match("bc")
      it do: expect("abcd").to match(~r/e/)
      it do: expect("abcd").to match("ad")
    end

  end

end
