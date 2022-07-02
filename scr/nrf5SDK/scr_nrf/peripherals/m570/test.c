#include "sdk_config.h"
#include "nrfx_spim.h"

#define SPI_INSTANCE  3                                           /**< SPI instance index. */
static const nrfx_spim_t spi = NRFX_SPIM_INSTANCE(SPI_INSTANCE);  /**< SPI instance. */
