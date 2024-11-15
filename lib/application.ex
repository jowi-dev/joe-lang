defmodule SExpr.Application do
  use Application

  def start(_type, _args) do
    children = [
      SExpr.Compiler.LLVMBackend
    ]

    opts = [strategy: :one_for_one, name: SExpr.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
