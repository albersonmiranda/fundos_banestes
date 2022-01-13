
#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @importFrom shinydashboardPlus boxLabel boxSidebar
#' @importFrom bs4Dash descriptionBlock
#' @import plotly
#' @import ggplot2
#' @importFrom magrittr %>%
#' @importFrom tidyr pivot_longer
#' @importFrom dplyr rename
#' @importFrom shinyjs useShinyjs
#' @noRd


app_ui <- function(request) {

  # load data
  data("fundos")
  data("resenhas_fundos")

  # set locale
  Sys.setlocale(locale = "pt_BR.UTF-8")

  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here
    dashboardPage(
      dashboardHeader(title = tags$a(
        href = "https://www.banestes.com.br",
        tags$img(
          src = "www/img/Institucional_Outline_Fundo-Azul-cropped.png",
          class = "center"
        )
      ), titleWidth = "150px"),
      dashboardSidebar(
        width = 175,
        collapsed = FALSE,
        sidebarMenu(id = "tabs",
          menuItem("Fundos", tabName = "fundos", icon = icon("money-bill-wave"),
                   menuSubItem("Fundos Banestes",
                               tabName = "fundos"),
                   menuSubItem("Fundos de Renda Fixa",
                               tabName = "fundos_renda_fixa"),
                   menuSubItem("Fundos de Ações",
                               tabName = "fundos_acoes"),
                   menuSubItem("Fundos Multimercado",
                               tabName = "fundos_multimercado")
          )
        )
      ),
      dashboardBody(shinyjs::useShinyjs(),
        tabItems(
          # tab fundos banestes
          tabItem(
            tabName = "fundos",
            mod_fundos_introducao_ui("fundos_introducao_ui_1")
          ),

          # tab fundos de renda fixa
          tabItem(
            tabName = "fundos_renda_fixa",
            mod_fundos_vitoria_500_ui("fundos_vitoria_500_ui_1"),
            mod_fundos_institucional_ui("fundos_institucional_ui_1"),
            mod_fundos_investidor_ui("fundos_investidor_ui_1"),
            mod_invest_public_ui("invest_public_ui_1"),
            mod_fundo_previdenciario_ui("fundo_previdenciario_ui_1"),
            mod_fundos_vip_ui("fundos_vip_ui_1"),
            mod_fundo_liquidez_ui("fundo_liquidez_ui_1"),
            mod_fundos_referencial_ui("fundos_referencial_ui_1"),
            mod_fundos_invest_money_ui("fundos_invest_money_ui_1"),
            mod_fundos_Solidez_ui("fundos_Solidez_ui_1"),
            mod_fundos_valores_ui("fundos_valores_ui_1"),
            mod_fundos_Estrategia_ui("fundos_Estrategia_ui_1")
          ),

          # tab Fundos de ações
          tabItem(
            tabName = "fundos_acoes",
            mod_fundos_dividendos_ui("fundos_dividendos_ui_1"),
            mod_fundos_btg_ui("fundos_btg_ui_1"),
          ),

          # tab Fundos Multimercado
          tabItem(
            tabName = "fundos_multimercado",
            mod_fundos_debentures_ui("fundos_debentures_ui_1")
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd


golem_add_external_resources <- function() {
  add_resource_path(
    "www", app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "Banestes Dashboard"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}