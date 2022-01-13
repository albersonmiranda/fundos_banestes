#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd

app_server <- function(input, output, session) {

  # List the first level callModules here
  mod_fundos_introducao_server("fundos_introducao_ui_1")
  mod_fundos_vitoria_500_server("fundos_vitoria_500_ui_1")
  mod_fundos_institucional_server("fundos_institucional_ui_1")
  mod_fundos_investidor_server("fundos_investidor_ui_1")
  mod_invest_public_server("invest_public_ui_1")
  mod_fundo_previdenciario_server("fundo_previdenciario_ui_1")
  mod_fundos_vip_server("fundos_vip_ui_1")
  mod_fundo_liquidez_server("fundo_liquidez_ui_1")
  mod_fundos_referencial_server("fundos_referencial_ui_1")
  mod_fundos_btg_server("fundos_btg_ui_1")
  mod_fundos_invest_money_server("fundos_invest_money_ui_1")
  mod_fundos_Solidez_server("fundos_Solidez_ui_1")
  mod_fundos_valores_server("fundos_valores_ui_1")
  mod_fundos_debentures_server("fundos_debentures_ui_1")
  mod_fundos_Estrategia_server("fundos_Estrategia_ui_1")
  mod_fundos_dividendos_server("fundos_dividendos_ui_1")

  #menu Itens
  observeEvent(input$tabs, {
    shinyjs::toggleClass(selector = "body", class = "sidebar-collapse")
  }, ignoreInit = TRUE)
}
