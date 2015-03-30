defmodule ESpec.Expect do
  @moduledoc """
  Defines helper functions for modules which use ESpec.
  These fucntions wraps arguments for ESpec.To module.
  """

  @doc false
  defmacro __using__(_arg) do
    quote do
      @doc "The same as `expect(subject)`"
      def is_expected do
        {ESpec.To, apply(__MODULE__, :subject, [])}
      end
    end
  end

  @doc "Wrapper for `ESpec.To`. Passes the value returned by the block."
  def expect(do: value), do: {ESpec.To, value}

  @doc "Wrapper for `ESpec.To`."
  def expect(value), do: {ESpec.To, value}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.Eq` asserion."
  def eq(value), do: {:eq, value}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.Eql` asserion."
  def eql(value), do: {:eql, value}

  @doc "Alias for `eq/1`"
  def be(value), do: {:eq, value}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.Be` asserion."
  def be(operator, value), do: {:be, operator,  value}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.BeBetween` asserion."
  def be_between(min, max), do: {:be_between, min, max}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.BeBetween` asserion."
  def be_close_to(value, delta), do: {:be_close, value, delta}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.Match` asserion"
  def match(value), do: {:match, value}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.RaiseException` asserion."
  def raise_exception(exception, message), do: {:raise_exception, [exception, message]}
  def raise_exception(exception), do: {:raise_exception, [exception]}
  def raise_exception(), do: {:raise_exception, []}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.ThrowTerm` asserion."
  def throw_term(term), do: {:throw_term, [term]}
  def throw_term(), do: {:throw_term, []}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.ChangeTo` assertion"
  def change(func, value), do: {:change_to, func, value}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.ChangeFromTo` assertion"
  def change(func, before, value), do: {:change_from_to, func, [before, value]}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.Enum.HaveAll` assertion"
  def have_all(func), do: {:have_all, func}
  
  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.Enum.HaveAll` assertion"
  def have_any(func), do: {:have_any, func}
  
  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.Enum.HaveAt` assertion"
  def have_at(pos, val), do: {:have_at, pos, val}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.Enum.HaveCount` assertion"
  def have_count(val), do: {:have_count, val}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.Enum.HaveCountBy` assertion"
  def have_count_by(func, val), do: {:have_count_by, func, val}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.Enum.Have` assertion"
  def have(val), do: {:have, val}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.Enum.BeEmpty` assertion"
  def be_empty, do: {:be_empty}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.Enum.HaveMax` assertion"
  def have_max(value), do: {:have_max, value}

  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.Enum.HaveMaxBy` assertion"
  def have_max_by(func, value), do: {:have_max_by, func, value}


  @doc "Returns `ESpec.To` argument to call `ESpec.Assertions.ThrowTerm` assertion"
  def accepted(func, args \\ []), do: {:accepted, func, args}
end
