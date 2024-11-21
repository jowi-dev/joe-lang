defmodule Arcane.Token do
  defstruct line: 0,
            col: 0,
            term: nil,
            type: :unknown

  @type t :: %__MODULE__{
          line: integer(),
          col: integer(),
          term: value_types(),
          type: token_types()
        }

  @type token_types ::
          :number
          | :assign
          | :comma
          | :assign
          | :plus
          | :float
          | :int
          | :ident
          | :expr_open
          | :expr_close
          | :string
          | :paren_open
          | :paren_close
          | :declare
          | :illegal
          | :eat

  @type value_types ::
          atom() | integer() | String.t() | float() | list(atom() | integer() | String.t())

  # Untested - unsure if I need these yet
  def illegal(val), do: %__MODULE__{type: :illegal, term: val}
  def file_end, do: %__MODULE__{type: :file_end, term: nil}
  def newline, do: %__MODULE__{type: :newline, term: nil}

  # Lexer - Tested
  def comma, do: %__MODULE__{type: :comma, term: ","}
  def assign, do: %__MODULE__{type: :assign, term: "="}
  def plus, do: %__MODULE__{type: :plus, term: "+"}
  def float(val), do: %__MODULE__{type: :float, term: String.to_float(val)}
  def int(val), do: %__MODULE__{type: :int, term: String.to_integer(val)}
  def ident(val), do: %__MODULE__{type: :ident, term: val}
  def expr_open, do: %__MODULE__{type: :expr_open, term: "=>"}
  def expr_close, do: %__MODULE__{type: :expr_close, term: "end"}
  def string(val), do: %__MODULE__{type: :string, term: String.replace(val, "\"", "")}
  def paren_l, do: %__MODULE__{type: :paren_open, term: "("}
  def paren_r, do: %__MODULE__{type: :paren_close, term: ")"}
  def declare, do: %__MODULE__{type: :declare, term: "::"}
end