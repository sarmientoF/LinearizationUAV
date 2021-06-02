# Lifting Linearization of UAV

## Overview

![](img/NewModel.png)

|    Non-linear System     |    Linear System    |
| :----------------------: | :-----------------: |
| ![](img/eq_expanded.png) | ![](img/eq_lin.png) |

### Auxiliary Parameters

|         Eta          |         Gamma          |
| :------------------: | :--------------------: |
| ![](img/eta_val.png) | ![](img/gamma_val.png) |

## Run this code

-   run `init.m` only once
-   run `NewGenerateTrainingInput.m`

## Code Flow

1. NewGenerateTrainingInput
2. NewSysIdentification
3. NewModelValidation
4. plot_validation
