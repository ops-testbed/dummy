package dev.yoon.dummy

import io.github.oshai.kotlinlogging.KotlinLogging
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class SystemController {
    private val logger = KotlinLogging.logger {}

    @GetMapping("/health")
    fun health(): String {
        logger.info { "test..!" }
        return "test..!"
    }
}
