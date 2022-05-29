package com.soul.servicebase.exception;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SoulException extends RuntimeException {

    private String msg;//状态信息

    private Integer code;//状态码


}
