defmodule SExpr do
  @moduledoc """
  Main module for the compiler application

  This module serves as an entry point for interacting with all points of the compiler
  """
  alias SExpr.Compiler

  @doc "Compile the expression and dump LLVM IR to stdout"
  def compile_expression(expr) do
    expr
    |> Compiler.compile_s_expression()
    |> Compiler.compile_llvm(:stdout)
  end

  @doc "Compile the expression and create a runnable executable"
  def compile_and_build(expr, output_name \\ "program") do
    # Ensure application is started
    Application.ensure_all_started(:s_expr)

    expr
    |> Compiler.compile_s_expression()
    |> Compiler.compile_llvm(output_name)
  end
end
