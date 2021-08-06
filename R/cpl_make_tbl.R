#' CPL table styling with [gt]
#'
#' Make a table conforming to CPL's table style
#'
#'@param data The table data for your table. [data.frame]
#'@param tbl_num The table number. [str]
#'@param tbl_title A descriptive table title. [str]
#'
#' @md
#' @export

cpl_make_tbl <- function(data,
                      tbl_num = NA,
                      tbl_title = NA) {

    tbl_cols <- ncol(data)

    table <- data %>%
        gt() %>%
        tab_options(
            # container size and table alignment within container
            container.width = px(760),
            table.align = "left",
            heading.align = "left",
            # grey horizontal table borders at top of header, below cols, and bottom of table body
            table.border.top.style = "solid",
            table.border.top.width = px(1),
            table.border.top.color = "#b2bbCb",
            heading.border.bottom.style = "hidden",
            column_labels.border.bottom.style = "solid",
            column_labels.border.bottom.width = px(1),
            column_labels.border.bottom.color = "#b2bbCb",
            table_body.border.top.style = "transparent",
            table_body.hlines.style = "transparent",
            table_body.border.bottom.style = "solid",
            table_body.border.bottom.width = px(1),
            table_body.border.bottom.color = "#b2bbCb",
            table.border.bottom.style = "hidden",
            # formatting font for for table components
            heading.title.font.size = px(11),
            heading.subtitle.font.size = px(15),
            column_labels.font.size = px(14),
            column_labels.text_transform = "uppercase",
            table.font.size = px(14),
            source_notes.font.size = px(12),
            footnotes.font.size = px(12),
            # row group label and border options
            row_group.font.size = px(14),
            row_group.border.top.style = "transparent",
            row_group.border.bottom.style = "hidden",
            stub.border.style = "hidden",
            # summary row border options
            summary_row.border.style = "solid",
            summary_row.border.width = px(1),
            summary_row.border.color = "#b2bbCb",
            # grand summary row border options
            grand_summary_row.border.style = "solid",
            grand_summary_row.border.width = px(1),
            grand_summary_row.border.color = "#b2bbCb"
        ) %>%
        # uppercase, left-aligned table and number
        # tab_style(
        #     style = list(
        #         cell_text(
        #             weight = "normal",
        #             align = "left",
        #             transform = "uppercase"
        #         )
        #     ),
        #     locations = cells_title("title")
        # ) %>%
        # # CPL blue, left-aligned table title
        # tab_style(
        #     style = list(
        #         cell_text(
        #             color = "#246195",
        #             weight = "normal",
        #             align = "left"
        #         )
        #     ),
        #     locations = cells_title("subtitle")
        # ) %>%
        # left-aligned first (left-most) column label/cells
        tab_style(
            style = list(
                cell_text(
                    align = "left"
                )
            ),
            locations = list(
                cells_body(
                    columns = 1
                    ),
                cells_column_labels(
                    columns = 1
                    )
            )
        ) %>%
        # center-aligned all other column lables/cells
        tab_style(
            style = list(
                cell_text(
                    align = "center"
                    )
            ),
            locations = list(
                cells_body(
                    columns = 2:tbl_cols
                    ),
                cells_column_labels(
                    columns = 2:tbl_cols
                    )
            )
        )

    # table number and title conditional formatting
    if(is.na(tbl_num) == FALSE && is.na(tbl_title) == FALSE) {

        tbl_num <- paste0("TABLE ", tbl_num, ".")

        table <- table %>%
            # using custom ccs/html formatting to produce single line title and table number
            tab_header(title = html(paste0('<div style="color:#246195;text-align:left;font-size:11px;font-weight:bold">',
                                           tbl_num,
                                           '<span style="font-size:15px;color:black;font-weight:normal">',
                                           tbl_title,
                                           '</span></div>')))

    } else if (is.na(tbl_num) == TRUE && is.na(tbl_title) == FALSE) {

        table <- table %>%
            # using custom ccs/html formatting to produce single line title and table number
            tab_header(title = html(paste0('<div style="color:#black;text-align:left;font-size:15px;font-weight:normal">',
                                           tbl_title,
                                           '</div>')))

    } else if (is.na(tbl_num) == FALSE && is.na(tbl_title) == TRUE) {

        tbl_num <- paste0("TABLE ", tbl_num, ".")

        table <- table %>%
            # using custom ccs/html formatting to produce single line title and table number
            tab_header(title = html(paste0('<div style="color:#246195;text-align:left;font-size:11px;font-weight:bold">',
                                           tbl_num,
                                           '</div>')))
    }

    return(table)

}
