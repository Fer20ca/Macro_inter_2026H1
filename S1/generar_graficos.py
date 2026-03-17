"""
Generacion de graficos de Cuenta Corriente (% del PBI)
Datos: World Development Indicators - BN.CAB.XOKA.GD.ZS
"""

import pandas as pd
import plotly.graph_objects as go
import plotly.express as px
import os

# -- Configuracion ----------------------------------------------------------
DATA_PATH = r"C:/Users/USER/Documents/GitHub/Macro_inter_2026H1/data_ca_world/ca_world.csv"
OUT_DIR = r"C:/Users/USER/Documents/GitHub/Macro_inter_2026H1/S1/graficos"
os.makedirs(OUT_DIR, exist_ok=True)

# -- Carga y limpieza -------------------------------------------------------
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

# -- Paleta y template ------------------------------------------------------
TEMPLATE = "plotly_white"
COLORS_LATAM = {
    "Peru": "#E63946",
    "Chile": "#457B9D",
    "Argentina": "#2A9D8F",
    "Colombia": "#E9C46A"
}
# Colores distintos para potencias (evitar solapamiento con LATAM)
COLORS_POWER = {
    "United States": "#1D3557",
    "China": "#D62828",
    "United Kingdom": "#6A0DAD",
    "Japan": "#FF8C00",
    "Germany": "#228B22"
}

ALL_COLORS = {**COLORS_LATAM, **COLORS_POWER}

latam = ["Peru", "Chile", "Argentina", "Colombia"]
powers = ["United States", "China", "United Kingdom", "Japan", "Germany"]
all_countries = latam + powers

# Codigos ISO para los paises evaluados
COUNTRY_CODES = ["PER", "CHL", "ARG", "COL", "USA", "CHN", "GBR", "JPN", "DEU"]


def save(fig, name, width=1100, height=600):
    """Guarda PNG y HTML interactivo."""
    fig.write_image(os.path.join(OUT_DIR, f"{name}.png"), width=width, height=height, scale=2)
    fig.write_html(os.path.join(OUT_DIR, f"{name}.html"), include_plotlyjs="cdn")
    print(f"  OK: {name}")


# ===========================================================================
# GRAFICO 1: Latinoamerica -- Peru, Chile, Argentina, Colombia (desde 1990)
# ===========================================================================
print("Generando graficos...")

df_latam = df_melted[
    (df_melted["Country Name"].isin(latam)) & (df_melted["Year"] >= 1990)
].dropna(subset=["CA_GDP"])

fig1 = go.Figure()
for country in latam:
    sub = df_latam[df_latam["Country Name"] == country].sort_values("Year")
    fig1.add_trace(go.Scatter(
        x=sub["Year"], y=sub["CA_GDP"],
        name=country, mode="lines+markers",
        line=dict(width=3, color=COLORS_LATAM[country]),
        marker=dict(size=5),
        hovertemplate="%{y:.2f}%<extra></extra>"
    ))

fig1.add_vrect(x0=2007, x1=2009, fillcolor="red", opacity=0.08, line_width=0,
               annotation_text="Crisis 2008", annotation_position="top left")
fig1.add_vrect(x0=2020, x1=2021, fillcolor="purple", opacity=0.08, line_width=0,
               annotation_text="COVID-19", annotation_position="top left")
fig1.add_hline(y=0, line_dash="dash", line_color="gray", line_width=1)

fig1.update_layout(
    title="Cuenta Corriente (% del PBI) -- Latinoamerica (1990-presente)",
    xaxis_title="Ano", yaxis_title="% del PBI",
    template=TEMPLATE,
    legend=dict(orientation="h", yanchor="bottom", y=1.02, xanchor="center", x=0.5),
    hovermode="x unified"
)
save(fig1, "01_cuenta_corriente_latam")

# ===========================================================================
# GRAFICO 2: Grandes potencias (desde 1990, lineas mas gruesas)
# ===========================================================================
df_powers = df_melted[
    (df_melted["Country Name"].isin(powers)) & (df_melted["Year"] >= 1990)
].dropna(subset=["CA_GDP"])

fig2 = go.Figure()
for country in powers:
    sub = df_powers[df_powers["Country Name"] == country].sort_values("Year")
    fig2.add_trace(go.Scatter(
        x=sub["Year"], y=sub["CA_GDP"],
        name=country, mode="lines+markers",
        line=dict(width=3.5, color=COLORS_POWER[country]),
        marker=dict(size=5),
        hovertemplate="%{y:.2f}%<extra></extra>"
    ))

fig2.add_vrect(x0=2007, x1=2009, fillcolor="red", opacity=0.08, line_width=0,
               annotation_text="Crisis 2008", annotation_position="top left")
fig2.add_vrect(x0=2020, x1=2021, fillcolor="purple", opacity=0.08, line_width=0,
               annotation_text="COVID-19", annotation_position="top left")
fig2.add_hline(y=0, line_dash="dash", line_color="gray", line_width=1)

fig2.update_layout(
    title="Cuenta Corriente (% del PBI) -- Grandes Potencias (1990-presente)",
    xaxis_title="Ano", yaxis_title="% del PBI",
    template=TEMPLATE,
    legend=dict(orientation="h", yanchor="bottom", y=1.02, xanchor="center", x=0.5),
    hovermode="x unified"
)
save(fig2, "02_cuenta_corriente_potencias")

# ===========================================================================
# GRAFICO 3: Mapa -- solo los 9 paises evaluados, colores mas fuertes
# ===========================================================================
df_latest = df_melted.dropna(subset=["CA_GDP"])
df_latest = df_latest.sort_values("Year").groupby("Country Code").last().reset_index()
# Filtrar solo los paises evaluados
df_latest_sel = df_latest[df_latest["Country Code"].isin(COUNTRY_CODES)]

fig3 = px.choropleth(
    df_latest_sel,
    locations="Country Code",
    color="CA_GDP",
    hover_name="Country Name",
    hover_data={"Year": True, "CA_GDP": ":.2f"},
    color_continuous_scale=[
        [0.0, "#b2182b"],    # rojo fuerte (deficit grande)
        [0.25, "#ef8a62"],   # rojo medio
        [0.45, "#fddbc7"],   # rosa claro
        [0.5, "#f7f7f7"],    # blanco (equilibrio)
        [0.55, "#d1e5f0"],   # azul claro
        [0.75, "#67a9cf"],   # azul medio
        [1.0, "#2166ac"],    # azul fuerte (superavit grande)
    ],
    color_continuous_midpoint=0,
    range_color=[-10, 10],
    labels={"CA_GDP": "CC (% PBI)", "Year": "Ano"},
    title="Cuenta Corriente (% del PBI) -- Paises Evaluados (ultimo dato disponible)"
)
fig3.update_layout(
    geo=dict(
        showframe=False, showcoastlines=True,
        projection_type="natural earth",
        showcountries=True,
        countrycolor="lightgray",
        showland=True, landcolor="#f0f0f0",
    ),
    template=TEMPLATE,
    coloraxis_colorbar=dict(title="% PBI", ticksuffix="%")
)
save(fig3, "03_mapa_cuenta_corriente", width=1300, height=700)

# ===========================================================================
# GRAFICOS 4-5: Ventanas historicas +/-5 anos
#   Crisis 2008: 2003-2013
#   Pandemia COVID-19: 2015-2025
#   - Leyenda debajo del grafico (no sobre el titulo)
#   - LATAM: lineas solidas, Potencias: lineas dasheadas (guiones)
#   - Colores distintos entre ambos grupos
#   - Lineas gruesas
# ===========================================================================
df_all = df_melted[df_melted["Country Name"].isin(all_countries)].dropna(subset=["CA_GDP"])

windows = [
    ("Crisis Financiera 2008", 2003, 2013, "04_ventana_crisis_2008"),
    ("Pandemia COVID-19", 2015, 2025, "05_ventana_pandemia"),
]

for title_evt, y0, y1, fname in windows:
    df_w = df_all[(df_all["Year"] >= y0) & (df_all["Year"] <= y1)]
    fig = go.Figure()

    # Primero LATAM (lineas solidas)
    for country in latam:
        sub = df_w[df_w["Country Name"] == country].sort_values("Year")
        if sub.empty:
            continue
        fig.add_trace(go.Scatter(
            x=sub["Year"], y=sub["CA_GDP"],
            name=country, mode="lines+markers",
            line=dict(width=3, color=COLORS_LATAM[country], dash="solid"),
            marker=dict(size=6, symbol="circle"),
            legendgroup="LATAM",
            legendgrouptitle_text="Latinoamerica",
            hovertemplate="%{y:.2f}%<extra></extra>"
        ))

    # Luego Potencias (lineas dasheadas con guiones)
    for country in powers:
        sub = df_w[df_w["Country Name"] == country].sort_values("Year")
        if sub.empty:
            continue
        fig.add_trace(go.Scatter(
            x=sub["Year"], y=sub["CA_GDP"],
            name=country, mode="lines+markers",
            line=dict(width=3, color=COLORS_POWER[country], dash="dash"),
            marker=dict(size=6, symbol="diamond"),
            legendgroup="Potencias",
            legendgrouptitle_text="Potencias",
            hovertemplate="%{y:.2f}%<extra></extra>"
        ))

    evt_year = 2008 if "2008" in fname else 2020
    fig.add_vrect(x0=evt_year - 1, x1=evt_year + 1, fillcolor="red", opacity=0.1, line_width=0,
                  annotation_text=title_evt, annotation_position="top left")
    fig.add_hline(y=0, line_dash="dash", line_color="gray", line_width=1)

    fig.update_layout(
        title=dict(
            text=f"Cuenta Corriente (% PBI) -- Ventana {title_evt} ({y0}-{y1})",
            y=0.95
        ),
        xaxis_title="Ano", yaxis_title="% del PBI",
        template=TEMPLATE,
        legend=dict(
            orientation="h",
            yanchor="top", y=-0.15,
            xanchor="center", x=0.5,
            font=dict(size=11),
        ),
        margin=dict(b=120),
        hovermode="x unified"
    )
    save(fig, fname, height=650)

# ===========================================================================
# GRAFICO 6 (animacion barras): ELIMINADO por redundante
# ===========================================================================
# Eliminar archivo anterior si existe
for ext in [".html"]:
    old = os.path.join(OUT_DIR, f"06_animacion_temporal{ext}")
    if os.path.exists(old):
        os.remove(old)
        print("  Eliminado: 06_animacion_temporal" + ext)

# ===========================================================================
# GRAFICO 7: Mapa animado -- solo los 9 paises evaluados
# ===========================================================================
df_map_anim = df_melted[
    (df_melted["Country Code"].isin(COUNTRY_CODES))
].dropna(subset=["CA_GDP"])
df_map_anim = df_map_anim[df_map_anim["Year"] >= 1990].sort_values("Year")

fig7 = px.choropleth(
    df_map_anim,
    locations="Country Code",
    color="CA_GDP",
    hover_name="Country Name",
    animation_frame="Year",
    color_continuous_scale=[
        [0.0, "#b2182b"],
        [0.25, "#ef8a62"],
        [0.45, "#fddbc7"],
        [0.5, "#f7f7f7"],
        [0.55, "#d1e5f0"],
        [0.75, "#67a9cf"],
        [1.0, "#2166ac"],
    ],
    color_continuous_midpoint=0,
    range_color=[-10, 10],
    labels={"CA_GDP": "CC (% PBI)", "Year": "Ano"},
    title="Cuenta Corriente (% PBI) -- Evolucion Animada de Paises Evaluados (1990-presente)"
)
fig7.update_layout(
    geo=dict(
        showframe=False, showcoastlines=True,
        projection_type="natural earth",
        showcountries=True,
        countrycolor="lightgray",
        showland=True, landcolor="#f0f0f0",
    ),
    template=TEMPLATE,
    coloraxis_colorbar=dict(title="% PBI", ticksuffix="%"),
    sliders=[dict(currentvalue=dict(prefix="Ano: "))],
)
fig7.write_html(os.path.join(OUT_DIR, "07_mapa_animado.html"), include_plotlyjs="cdn")
print("  OK: 07_mapa_animado (solo HTML)")

print("\nTodos los graficos generados en:", OUT_DIR)
