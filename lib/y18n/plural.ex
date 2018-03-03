defmodule Orisons.Y18N.Plural do
  defmodule LanguageException do
    @moduledoc """
    Exception raised when trying `get_plural!/1` for not defined language `behaviour` module.
    """

    defexception message: "Language not available in y18n."
  end

  @doc """
  Return variant of plural based on integer
  """
  @callback check(integer) :: binary

  @doc """
  Inform about amount of vartiants that can be returned by `check/1`
  """
  @callback variants() :: integer

  @doc """
  Keyword list of modules where key is language shortcut
  """
  def get_plurals do
    [
      ach: Orisons.Y18N.Plural.Ach,
      af: Orisons.Y18N.Plural.Af,
      ak: Orisons.Y18N.Plural.Ak,
      am: Orisons.Y18N.Plural.Am,
      an: Orisons.Y18N.Plural.An,
      anp: Orisons.Y18N.Plural.Anp,
      ar: Orisons.Y18N.Plural.Ar,
      arn: Orisons.Y18N.Plural.Arn,
      as: Orisons.Y18N.Plural.As,
      ast: Orisons.Y18N.Plural.Ast,
      ay: Orisons.Y18N.Plural.Ay,
      az: Orisons.Y18N.Plural.Az,
      be: Orisons.Y18N.Plural.Be,
      bg: Orisons.Y18N.Plural.Bg,
      bn: Orisons.Y18N.Plural.Bn,
      bo: Orisons.Y18N.Plural.Bo,
      br: Orisons.Y18N.Plural.Br,
      brx: Orisons.Y18N.Plural.Brx,
      bs: Orisons.Y18N.Plural.Bs,
      ca: Orisons.Y18N.Plural.Ca,
      cgg: Orisons.Y18N.Plural.Cgg,
      cs: Orisons.Y18N.Plural.Cs,
      csb: Orisons.Y18N.Plural.Csb,
      cy: Orisons.Y18N.Plural.Cy,
      da: Orisons.Y18N.Plural.Da,
      de: Orisons.Y18N.Plural.De,
      doi: Orisons.Y18N.Plural.Doi,
      dz: Orisons.Y18N.Plural.Dz,
      el: Orisons.Y18N.Plural.El,
      en: Orisons.Y18N.Plural.En,
      eo: Orisons.Y18N.Plural.Eo,
      es: Orisons.Y18N.Plural.Es,
      et: Orisons.Y18N.Plural.Et,
      eu: Orisons.Y18N.Plural.Eu,
      fa: Orisons.Y18N.Plural.Fa,
      ff: Orisons.Y18N.Plural.Ff,
      fi: Orisons.Y18N.Plural.Fi,
      fil: Orisons.Y18N.Plural.Fil,
      fo: Orisons.Y18N.Plural.Fo,
      fr: Orisons.Y18N.Plural.Fr,
      fur: Orisons.Y18N.Plural.Fur,
      fy: Orisons.Y18N.Plural.Fy,
      ga: Orisons.Y18N.Plural.Ga,
      gd: Orisons.Y18N.Plural.Gd,
      gl: Orisons.Y18N.Plural.Gl,
      gu: Orisons.Y18N.Plural.Gu,
      gun: Orisons.Y18N.Plural.Gun,
      ha: Orisons.Y18N.Plural.Ha,
      he: Orisons.Y18N.Plural.He,
      hi: Orisons.Y18N.Plural.Hi,
      hne: Orisons.Y18N.Plural.Hne,
      hr: Orisons.Y18N.Plural.Hr,
      hu: Orisons.Y18N.Plural.Hu,
      hy: Orisons.Y18N.Plural.Hy,
      ia: Orisons.Y18N.Plural.Ia,
      id: Orisons.Y18N.Plural.Id,
      is: Orisons.Y18N.Plural.Is,
      it: Orisons.Y18N.Plural.It,
      ja: Orisons.Y18N.Plural.Ja,
      jbo: Orisons.Y18N.Plural.Jbo,
      jv: Orisons.Y18N.Plural.Jv,
      ka: Orisons.Y18N.Plural.Ka,
      kk: Orisons.Y18N.Plural.Kk,
      kl: Orisons.Y18N.Plural.Kl,
      km: Orisons.Y18N.Plural.Km,
      kn: Orisons.Y18N.Plural.Kn,
      ko: Orisons.Y18N.Plural.Ko,
      ku: Orisons.Y18N.Plural.Ku,
      kw: Orisons.Y18N.Plural.Kw,
      ky: Orisons.Y18N.Plural.Ky,
      lb: Orisons.Y18N.Plural.Lb,
      ln: Orisons.Y18N.Plural.Ln,
      lo: Orisons.Y18N.Plural.Lo,
      lt: Orisons.Y18N.Plural.Lt,
      lv: Orisons.Y18N.Plural.Lv,
      mai: Orisons.Y18N.Plural.Mai,
      me: Orisons.Y18N.Plural.Me,
      mfe: Orisons.Y18N.Plural.Mfe,
      mg: Orisons.Y18N.Plural.Mg,
      mi: Orisons.Y18N.Plural.Mi,
      mk: Orisons.Y18N.Plural.Mk,
      ml: Orisons.Y18N.Plural.Ml,
      mn: Orisons.Y18N.Plural.Mn,
      mni: Orisons.Y18N.Plural.Mni,
      mnk: Orisons.Y18N.Plural.Mnk,
      mr: Orisons.Y18N.Plural.Mr,
      ms: Orisons.Y18N.Plural.Ms,
      mt: Orisons.Y18N.Plural.Mt,
      my: Orisons.Y18N.Plural.My,
      nah: Orisons.Y18N.Plural.Nah,
      nap: Orisons.Y18N.Plural.Nap,
      nb: Orisons.Y18N.Plural.Nb,
      ne: Orisons.Y18N.Plural.Ne,
      nl: Orisons.Y18N.Plural.Nl,
      nn: Orisons.Y18N.Plural.Nn,
      no: Orisons.Y18N.Plural.No,
      nso: Orisons.Y18N.Plural.Nso,
      oc: Orisons.Y18N.Plural.Oc,
      or: Orisons.Y18N.Plural.Or,
      pa: Orisons.Y18N.Plural.Pa,
      pap: Orisons.Y18N.Plural.Pap,
      pl: Orisons.Y18N.Plural.Pl,
      pms: Orisons.Y18N.Plural.Pms,
      ps: Orisons.Y18N.Plural.Ps,
      pt: Orisons.Y18N.Plural.Pt,
      rm: Orisons.Y18N.Plural.Rm,
      ro: Orisons.Y18N.Plural.Ro,
      ru: Orisons.Y18N.Plural.Ru,
      rw: Orisons.Y18N.Plural.Rw,
      sah: Orisons.Y18N.Plural.Sah,
      sat: Orisons.Y18N.Plural.Sat,
      sco: Orisons.Y18N.Plural.Sco,
      sd: Orisons.Y18N.Plural.Sd,
      se: Orisons.Y18N.Plural.Se,
      si: Orisons.Y18N.Plural.Si,
      sk: Orisons.Y18N.Plural.Sk,
      sl: Orisons.Y18N.Plural.Sl,
      so: Orisons.Y18N.Plural.So,
      son: Orisons.Y18N.Plural.Son,
      sq: Orisons.Y18N.Plural.Sq,
      sr: Orisons.Y18N.Plural.Sr,
      su: Orisons.Y18N.Plural.Su,
      sv: Orisons.Y18N.Plural.Sv,
      sw: Orisons.Y18N.Plural.Sw,
      ta: Orisons.Y18N.Plural.Ta,
      te: Orisons.Y18N.Plural.Te,
      tg: Orisons.Y18N.Plural.Tg,
      th: Orisons.Y18N.Plural.Th,
      ti: Orisons.Y18N.Plural.Ti,
      tk: Orisons.Y18N.Plural.Tk,
      tr: Orisons.Y18N.Plural.Tr,
      tt: Orisons.Y18N.Plural.Tt,
      ug: Orisons.Y18N.Plural.Ug,
      uk: Orisons.Y18N.Plural.Uk,
      ur: Orisons.Y18N.Plural.Ur,
      uz: Orisons.Y18N.Plural.Uz,
      vi: Orisons.Y18N.Plural.Vi,
      wa: Orisons.Y18N.Plural.Wa,
      wo: Orisons.Y18N.Plural.Wo,
      yo: Orisons.Y18N.Plural.Yo,
      zh: Orisons.Y18N.Plural.Zh,
      zh: Orisons.Y18N.Plural.Zh
    ]
    |> Keyword.merge(Application.get_env(:y18n, :custom_plurals, Keyword.new()))
  end

  @doc """
  Get plural module by language shortcut

  ## Example:

      iex> Orisons.Y18N.Plural.get_plural(:en)
      {:ok, Orisons.Y18N.Plural.En}

  """
  def get_plural(lang) do
    Keyword.fetch(get_plurals(), lang)
    |> case do
      :error -> {:error, "Language not available in y18n."}
      {:ok, module} -> {:ok, module}
    end
  end

  @doc """
  Same as `Orisons.Y18N.Plural.get_plural/1`, but if language is not defined will throw `Orisons.Y18N.Plural.LanguageException`
  """
  def get_plural!(lang) do
    Keyword.fetch(get_plurals(), lang)
    |> case do
      :error -> raise LanguageException
      {:ok, module} -> module
    end
  end

  @doc """
  Determinates plural variant based on `count` and `lang`

  ## Example:

      iex> Orisons.Y18N.Plural.get_plural_count(1, :pl)
      "a"

  """
  def get_plural_count(count, lang) do
    plural = get_plural!(lang)
    plural.check(count)
  end
end
