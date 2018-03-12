defmodule Orisons.Y18N.Mixfile do
  use Mix.Project

  def project do
    [
      app: :y18n,
      version: "1.0.0",
      elixir: "~> 1.4",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      name: "Y18N",
      source_url: "https://github.com/orisons/y18n",
      homepage_url: "https://orisons.io",
      description: description(),
      package: package(),
      docs: [
        main: "README",
        # logo: "logo.png",
        extra_section: "GUIDES",
        extras: ["README.md", "guides/CONFIGURATION.md", "guides/INTEGRATION.md"],
        groups_for_modules: groups_for_modules()
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Orisons.Y18N.App, []},
      extra_applications: [:logger, :yaml_elixir]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:yaml_elixir, "~> 1.3"},
      {:earmark, "~> 1.2", only: :dev, runtime: false},
      {:ex_doc, "~> 0.18", only: :dev, runtime: false}
    ]
  end

  defp description() do
    "Internationalization library based on YAML files."
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "Y18N",
      # These are the default files included in the package
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Krystian Drożdżyński"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/orisons/y18n", "Website" => "https://orisons.io"}
    ]
  end

  defp groups_for_modules() do
    [
      Plurals: [
        Orisons.Y18N.Plural.Ach,
        Orisons.Y18N.Plural.Af,
        Orisons.Y18N.Plural.Ak,
        Orisons.Y18N.Plural.Am,
        Orisons.Y18N.Plural.An,
        Orisons.Y18N.Plural.Anp,
        Orisons.Y18N.Plural.Ar,
        Orisons.Y18N.Plural.Arn,
        Orisons.Y18N.Plural.As,
        Orisons.Y18N.Plural.Ast,
        Orisons.Y18N.Plural.Ay,
        Orisons.Y18N.Plural.Az,
        Orisons.Y18N.Plural.Be,
        Orisons.Y18N.Plural.Bg,
        Orisons.Y18N.Plural.Bn,
        Orisons.Y18N.Plural.Bo,
        Orisons.Y18N.Plural.Br,
        Orisons.Y18N.Plural.Brx,
        Orisons.Y18N.Plural.Bs,
        Orisons.Y18N.Plural.Ca,
        Orisons.Y18N.Plural.Cgg,
        Orisons.Y18N.Plural.Cs,
        Orisons.Y18N.Plural.Csb,
        Orisons.Y18N.Plural.Cy,
        Orisons.Y18N.Plural.Da,
        Orisons.Y18N.Plural.De,
        Orisons.Y18N.Plural.Doi,
        Orisons.Y18N.Plural.Dz,
        Orisons.Y18N.Plural.El,
        Orisons.Y18N.Plural.En,
        Orisons.Y18N.Plural.Eo,
        Orisons.Y18N.Plural.Es,
        Orisons.Y18N.Plural.Et,
        Orisons.Y18N.Plural.Eu,
        Orisons.Y18N.Plural.Fa,
        Orisons.Y18N.Plural.Ff,
        Orisons.Y18N.Plural.Fi,
        Orisons.Y18N.Plural.Fil,
        Orisons.Y18N.Plural.Fo,
        Orisons.Y18N.Plural.Fr,
        Orisons.Y18N.Plural.Fur,
        Orisons.Y18N.Plural.Fy,
        Orisons.Y18N.Plural.Ga,
        Orisons.Y18N.Plural.Gd,
        Orisons.Y18N.Plural.Gl,
        Orisons.Y18N.Plural.Gu,
        Orisons.Y18N.Plural.Gun,
        Orisons.Y18N.Plural.Ha,
        Orisons.Y18N.Plural.He,
        Orisons.Y18N.Plural.Hi,
        Orisons.Y18N.Plural.Hne,
        Orisons.Y18N.Plural.Hr,
        Orisons.Y18N.Plural.Hu,
        Orisons.Y18N.Plural.Hy,
        Orisons.Y18N.Plural.Ia,
        Orisons.Y18N.Plural.Id,
        Orisons.Y18N.Plural.Is,
        Orisons.Y18N.Plural.It,
        Orisons.Y18N.Plural.Ja,
        Orisons.Y18N.Plural.Jbo,
        Orisons.Y18N.Plural.Jv,
        Orisons.Y18N.Plural.Ka,
        Orisons.Y18N.Plural.Kk,
        Orisons.Y18N.Plural.Kl,
        Orisons.Y18N.Plural.Km,
        Orisons.Y18N.Plural.Kn,
        Orisons.Y18N.Plural.Ko,
        Orisons.Y18N.Plural.Ku,
        Orisons.Y18N.Plural.Kw,
        Orisons.Y18N.Plural.Ky,
        Orisons.Y18N.Plural.Lb,
        Orisons.Y18N.Plural.Ln,
        Orisons.Y18N.Plural.Lo,
        Orisons.Y18N.Plural.Lt,
        Orisons.Y18N.Plural.Lv,
        Orisons.Y18N.Plural.Mai,
        Orisons.Y18N.Plural.Me,
        Orisons.Y18N.Plural.Mfe,
        Orisons.Y18N.Plural.Mg,
        Orisons.Y18N.Plural.Mi,
        Orisons.Y18N.Plural.Mk,
        Orisons.Y18N.Plural.Ml,
        Orisons.Y18N.Plural.Mn,
        Orisons.Y18N.Plural.Mni,
        Orisons.Y18N.Plural.Mnk,
        Orisons.Y18N.Plural.Mr,
        Orisons.Y18N.Plural.Ms,
        Orisons.Y18N.Plural.Mt,
        Orisons.Y18N.Plural.My,
        Orisons.Y18N.Plural.Nah,
        Orisons.Y18N.Plural.Nap,
        Orisons.Y18N.Plural.Nb,
        Orisons.Y18N.Plural.Ne,
        Orisons.Y18N.Plural.Nl,
        Orisons.Y18N.Plural.Nn,
        Orisons.Y18N.Plural.No,
        Orisons.Y18N.Plural.Nso,
        Orisons.Y18N.Plural.Oc,
        Orisons.Y18N.Plural.Or,
        Orisons.Y18N.Plural.Pa,
        Orisons.Y18N.Plural.Pap,
        Orisons.Y18N.Plural.Pl,
        Orisons.Y18N.Plural.Pms,
        Orisons.Y18N.Plural.Ps,
        Orisons.Y18N.Plural.Pt,
        Orisons.Y18N.Plural.Rm,
        Orisons.Y18N.Plural.Ro,
        Orisons.Y18N.Plural.Ru,
        Orisons.Y18N.Plural.Rw,
        Orisons.Y18N.Plural.Sah,
        Orisons.Y18N.Plural.Sat,
        Orisons.Y18N.Plural.Sco,
        Orisons.Y18N.Plural.Sd,
        Orisons.Y18N.Plural.Se,
        Orisons.Y18N.Plural.Si,
        Orisons.Y18N.Plural.Sk,
        Orisons.Y18N.Plural.Sl,
        Orisons.Y18N.Plural.So,
        Orisons.Y18N.Plural.Son,
        Orisons.Y18N.Plural.Sq,
        Orisons.Y18N.Plural.Sr,
        Orisons.Y18N.Plural.Su,
        Orisons.Y18N.Plural.Sv,
        Orisons.Y18N.Plural.Sw,
        Orisons.Y18N.Plural.Ta,
        Orisons.Y18N.Plural.Te,
        Orisons.Y18N.Plural.Tg,
        Orisons.Y18N.Plural.Th,
        Orisons.Y18N.Plural.Ti,
        Orisons.Y18N.Plural.Tk,
        Orisons.Y18N.Plural.Tr,
        Orisons.Y18N.Plural.Tt,
        Orisons.Y18N.Plural.Ug,
        Orisons.Y18N.Plural.Uk,
        Orisons.Y18N.Plural.Ur,
        Orisons.Y18N.Plural.Uz,
        Orisons.Y18N.Plural.Vi,
        Orisons.Y18N.Plural.Wa,
        Orisons.Y18N.Plural.Wo,
        Orisons.Y18N.Plural.Yo,
        Orisons.Y18N.Plural.Zh
      ]
    ]
  end
end
