package com.nadeuli.serviceCenter.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CSRequestDTO {
    private String MEM_EMAIL;
    private String MEM_NAME;
    private String q_Content;
}
