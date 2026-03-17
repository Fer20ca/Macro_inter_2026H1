"""
Generación de gráficos de Cuenta Corriente (% del PBI)
Datos: World Development Indicators - BN.CAB.XOKA.GD.ZS
"""

import pandas as pd
import plotly.graph_objects as go
import plotly.express as px
import os

# ── Configuración ──────────────────────────────────────────────────────────
DATA_PATH = r"C:/Users/USER/Documents/GitHub/Macro_inter_2026H1/data_ca_world/ca_world.csv"
OUT_DIR = r"C:/Users/USER/Documents/GitHub/Macro_inter_2026H1/S1/graficos"
os.makedirs(OUT_DIR, exist_ok=True)

# ── Carga y limpieza ──────────────────────────────────────────────────────
df = pd.read_csv(DATA_PATH, skiprows=4)
year_cols = [c for c in df.columns if c.isdigit()]
df_melted = df.melt(
    id_vars=["Country Name", "Country Code"],
    value_vars=year_cols,
    var_name="Year",
    value_name="CA_GDP"
)
df_melted["Year"] = df_melted["Year"].astype(int)
df_melted["CA_GDP"] = pd.to_numeric(df_melted["CA_GDP"], errors="coerce")

# ── Paleta y template ─────────────────────────────────────────────────────
TEMPLATE = "plotly_white"
COLORS_LATAM = {"Peru": "#E63946", "Chile": "#457B9D", "Argentina": "#2A9D8F", "Colombia": "#E9C46A"}
COLORS_POWER = {"United States": "#1D3557", "China": "#E63946", "United Kingdom": "#457B9D",
                "Japan": "#2A9D8F", "Germany": "#F4A261"}

def save(fig, name, width=1100, height=600):
    """Guarda PNG y HTML interactivo."""
    fig.write_image(os.path.join(OUT_DIR, f"{name}.png"), width=width, height=height, scale=2)
    fig.write_html(os.path.join(OUT_DIR, f"{name}.html"), include_plotlyjs="cdn")
    print(f"  OK: {name}")

# ═══════════════════════════════════════════════════════════════════════════
# GRÁFICO 1: Latinoamérica — Perú, Chile, Argentina, Colombia
# ═══════════════════════════════════════════════════════════════════════════
print("Generando gráficos...")

latam = ["Peru", "Chile", "Argentina", "Colombia"]
df_latam = df_melted[df_melted["Country Name"].isin(latam)].dropna(subset=["CA_GDP"])

fig1 = go.Figure()
for country in latam:
    sub = df_latam[df_latam["Country Name"] == country].sort_values("Year")
    fig1.add_trace(go.Scatter(
        x=sub["Year"], y=sub["CA_GDP"],
        name=country, mode="lines+markers",
        line=dict(width=2.5, color=COLORS_LATAM[country]),
        marker=dict(size=4),
        hovertemplate="%{x}: %{y:.2f}%<extra>" + country + "</extra>"
    ))

# Bandas de eventos
fig1.add_vrect(x0=2007, x1=2009, fillcolor="red", opacity=0.08, line_width=0,
               annotation_text="Crisis 2008", annotation_position="top left")
fig1.add_vrect(x0=2020, x1=2021, fillcolor="purple", opacity=0.08, line_width=0,
               annotation_text="COVID-19", annotation_position="top left")
fig1.add_hline(y=0, line_dash="dash", line_color="gray", line_width=1)

fig1.update_layout(
    title="Cuenta Corriente (% del PBI) — Latinoamérica",
    xaxis_title="Año", yaxis_title="% del PBI",
    template=TEMPLATE,
    legend=dict(orientation="h", yanchor="bottom", y=1.02, xanchor="center", x=0.5),
    hovermode="x unified"
)
save(fig1, "01_cuenta_corriente_latam")

# ═══════════════════════════════════════════════════════════════════════════
# GRÁFICO 2: Grandes potencias — USA, China, UK, Japón, Alemania
# ═══════════════════════════════════════════════════════════════════════════
powers = ["United States", "China", "United Kingdom", "Japan", "Germany"]
df_powers = df_melted[df_melted["Country Name"].isin(powers)].dropna(subset=["CA_GDP"])

fig2 = go.Figure()
for country in powers:
    sub = df_powers[df_powers["Country Name"] == country].sort_values("Year")
    fig2.add_trace(go.Scatter(
        x=sub["Year"], y=sub["CA_GDP"],
        name=country, mode="lines+markers",
        line=dict(width=2.5, color=COLORS_POWER[country]),
        marker=dict(size=4),
        hovertemplate="%{x}: %{y:.2f}%<extra>" + country + "</extra>"
    ))

fig2.add_vrect(x0=2007, x1=2009, fillcolor="red", opacity=0.08, line_width=0,
               annotation_text="Crisis 2008", annotation_position="top left")
fig2.add_vrect(x0=2020, x1=2021, fillcolor="purple", opacity=0.08, line_width=0,
               annotation_text="COVID-19", annotation_position="top left")
fig2.add_hline(y=0, line_dash="dash", line_color="gray", line_width=1)

fig2.update_layout(
    title="Cuenta Corriente (% del PBI) — Grandes Potencias",
    xaxis_title="Año", yaxis_title="% del PBI",
    template=TEMPLATE,
    legend=dict(orientation="h", yanchor="bottom", y=1.02, xanchor="center", x=0.5),
    hovermode="x unified"
)
save(fig2, "02_cuenta_corriente_potencias")

# ═══════════════════════════════════════════════════════════════════════════
# GRÁFICO 3: Mapa mundial — último año disponible
# ═══════════════════════════════════════════════════════════════════════════
# Tomar el último año con datos para cada país
df_latest = df_melted.dropna(subset=["CA_GDP"])
df_latest = df_latest.sort_values("Year").groupby("Country Code").last().reset_index()

fig3 = px.choropleth(
    df_latest,
    locations="Country Code",
    color="CA_GDP",
    hover_name="Country Name",
    hover_data={"Year": True, "CA_GDP": ":.2f"},
    color_continuous_scale="RdBu",
    color_continuous_midpoint=0,
    range_color=[-20, 20],
    labels={"CA_GDP": "CC (% PBI)", "Year": "Año"},
    title="Cuenta Corriente (% del PBI) — Mapa Mundial (último dato disponible)"
)
fig3.update_layout(
    geo=dict(showframe=False, showcoastlines=True, projection_type="natural earth"),
    template=TEMPLATE,
    coloraxis_colorbar=dict(title="% PBI", ticksuffix="%")
)
save(fig3, "03_mapa_cuenta_corriente", width=1300, height=700)

# ═══════════════════════════════════════════════════════════════════════════
# GRÁFICOS 4-5: Ventanas históricas ±5 años
#   Crisis 2008: 2003–2013
#   Pandemia COVID-19: 2015–2025
# ═══════════════════════════════════════════════════════════════════════════
all_countries = latam + powers
df_all = df_melted[df_melted["Country Name"].isin(all_countries)].dropna(subset=["CA_GDP"])
ALL_COLORS = {**COLORS_LATAM, **COLORS_POWER}

windows = [
    ("Crisis Financiera 2008", 2003, 2013, "04_ventana_crisis_2008"),
    ("Pandemia COVID-19", 2015, 2025, "05_ventana_pandemia"),
]

for title_evt, y0, y1, fname in windows:
    df_w = df_all[(df_all["Year"] >= y0) & (df_all["Year"] <= y1)]
    fig = go.Figure()
    for country in all_countries:
        sub = df_w[df_w["Country Name"] == country].sort_values("Year")
        if sub.empty:
            continue
        is_latam = country in latam
        fig.add_trace(go.Scatter(
            x=sub["Year"], y=sub["CA_GDP"],
            name=country, mode="lines+markers",
            line=dict(width=2.5 if is_latam else 1.8,
                      color=ALL_COLORS[country],
                      dash="solid" if is_latam else "dot"),
            marker=dict(size=5 if is_latam else 3),
            legendgroup="LATAM" if is_latam else "Potencias",
            legendgrouptitle_text="Latinoamérica" if is_latam else "Potencias",
            hovertemplate="%{x}: %{y:.2f}%<extra>" + country + "</extra>"
        ))

    # Marcar el evento central
    evt_year = 2008 if "2008" in fname else 2020
    fig.add_vrect(x0=evt_year - 1, x1=evt_year + 1, fillcolor="red", opacity=0.1, line_width=0,
                  annotation_text=title_evt, annotation_position="top left")
    fig.add_hline(y=0, line_dash="dash", line_color="gray", line_width=1)

    fig.update_layout(
        title=f"Cuenta Corriente (% PBI) — Ventana {title_evt} ({y0}–{y1})",
        xaxis_title="Año", yaxis_title="% del PBI",
        template=TEMPLATE,
        legend=dict(orientation="h", yanchor="bottom", y=1.02, xanchor="center", x=0.5),
        hovermode="x unified"
    )
    save(fig, fname)

# ═══════════════════════════════════════════════════════════════════════════
# GRÁFICO 6: Animación temporal (dinámico) — Barras por año
# ═══════════════════════════════════════════════════════════════════════════
df_anim = df_all[df_all["Year"] >= 1990].copy()
df_anim = df_anim.sort_values(["Year", "Country Name"])

fig6 = px.bar(
    df_anim,
    x="Country Name", y="CA_GDP",
    color="Country Name",
    color_discrete_map=ALL_COLORS,
    animation_frame="Year",
    range_y=[df_anim["CA_GDP"].min() - 3, df_anim["CA_GDP"].max() + 3],
    labels={"CA_GDP": "CC (% PBI)", "Country Name": "País"},
    title="Evolución de la Cuenta Corriente (% PBI) — Animación Temporal (1990–presente)"
)
fig6.add_hline(y=0, line_dash="dash", line_color="gray", line_width=1)
fig6.update_layout(
    template=TEMPLATE,
    showlegend=False,
    xaxis_tickangle=-30,
    sliders=[dict(currentvalue=dict(prefix="Año: "))],
)
# Solo HTML interactivo (la animación no tiene sentido como PNG estático)
fig6.write_html(os.path.join(OUT_DIR, "06_animacion_temporal.html"), include_plotlyjs="cdn")
print("  OK: 06_animacion_temporal (solo HTML)")

# ═══════════════════════════════════════════════════════════════════════════
# GRÁFICO 7: Mapa animado (dinámico) — Evolución mundial por año
# ═══════════════════════════════════════════════════════════════════════════
df_map_anim = df_melted.dropna(subset=["CA_GDP"])
df_map_anim = df_map_anim[df_map_anim["Year"] >= 1990].sort_values("Year")

fig7 = px.choropleth(
    df_map_anim,
    locations="Country Code",
    color="CA_GDP",
    hover_name="Country Name",
    animation_frame="Year",
    color_continuous_scale="RdBu",
    color_continuous_midpoint=0,
    range_color=[-15, 15],
    labels={"CA_GDP": "CC (% PBI)", "Year": "Año"},
    title="Cuenta Corriente (% PBI) — Evolución Mundial Animada (1990–presente)"
)
fig7.update_layout(
    geo=dict(showframe=False, showcoastlines=True, projection_type="natural earth"),
    template=TEMPLATE,
    coloraxis_colorbar=dict(title="% PBI", ticksuffix="%"),
    sliders=[dict(currentvalue=dict(prefix="Año: "))],
)
fig7.write_html(os.path.join(OUT_DIR, "07_mapa_animado.html"), include_plotlyjs="cdn")
print("  OK: 07_mapa_animado (solo HTML)")

print("\nTodos los graficos generados en:", OUT_DIR)
