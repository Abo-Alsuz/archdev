# Arch Linux NVIDIA Driver & Architecture Code Map

A unified reference table mapping NVIDIA hardware codenames, generations, and internal chip identifiers to their correct Arch Linux package requirements.

## 🛠️ Unified Architecture & Driver Mapping

| Code Prefix | Core Chip Naming Scheme | Architecture Generation | Target Arch Linux Driver Package | Max Driver Branch | Driver Lifecycle Status |
| :---: | :--- | :--- | :--- | :---: | :--- |
| **`GB`** | `GB202`, `GB203`, `GB205`, `GB206`, `GB207` | Blackwell | `nvidia-open` / `nvidia` | *Active* | **Mainline (Stable)** |
| **`AD`** | `AD102`, `AD103`, `AD104`, `AD106`, `AD107` | Ada Lovelace | `nvidia-open` / `nvidia` | *Active* | **Mainline (Stable)** |
| **`GA`** | `GA100`, `GA102`, `GA104`, `GA106`, `GA107` | Ampere | `nvidia-open` / `nvidia` | *Active* | **Mainline (Stable)** |
| **`TU`** | `TU102`, `TU104`, `TU106`, `TU116`, `TU117` | Turing | `nvidia-open` / `nvidia` | *Active* | **Mainline (Stable)** |
| **`GV`** | `GV100`, `GV10B` | Volta | `nvidia` *(Proprietary Only)* | *Active* | **Mainline (Stable)** |
| **`GP`** | `GP100`, `GP102`, `GP104`, `GP106`, `GP107`, `GP108` | Pascal | `nvidia-580xx-dkms` *(AUR)* | **580xx** | **Legacy (EOL)** |
| **`GM`** | `GM200`, `GM204`, `GM206`, `GM107`, `GM108` | Maxwell | `nvidia-580xx-dkms` *(AUR)* | **580xx** | **Legacy (EOL)** |
| **`GK`** | `GK104`, `GK106`, `GK107`, `GK110`, `GK208`, `GK210` | Kepler | `nvidia-470xx-dkms` *(AUR)* | **470xx** | **Legacy (EOL)** |
| **`GF`** | `GF100`, `GF104`, `GF106`, `GF108`, `GF110`, `GF114` | Fermi | `nvidia-390xx-dkms` *(AUR)* | **390xx** | **Legacy (EOL)** |
| **`NV`** / **`G`**| `G80`, `G92`, `GT200`, `GF119` (Some low-end Fermi) | Tesla & Older | Integrated Kernel Driver | *None* | **`nouveau` (Open-Source)** |

---

## 🔍 Core Chip & GPU Match-up Examples

If you catch the internal core string of a device, here is how they fall into common consumer and enterprise hardware names:

### 🟢 Mainline Drivers (`nvidia-open` / `nvidia`)
* **`GBxxx` (Blackwell):** RTX 5090, RTX 5080, RTX 5070, RTX 5060, B200 Data Center
* **`ADxxx` (Ada Lovelace):** RTX 4090, RTX 4080, RTX 4070 Ti, RTX 4060, RTX 4050 Mobile, RTX 6000 Ada
* **`GAxxx` (Ampere):** RTX 3090 Ti, RTX 3080, RTX 3070, RTX 3060, RTX 3050, A4000, A100
* **`TUxxx` (Turing):** RTX 2080 Ti, RTX 2070, GTX 1660 Ti, GTX 1660 Super, GTX 1650, Quadro RTX 4000, T600
* **`GVxxx` (Volta):** TITAN V, Tesla V100 *(Note: Requires proprietary `nvidia` package; does not support `nvidia-open` out of the box).*

### 🟡 Legacy 580xx Drivers (`nvidia-580xx-dkms`)
* **`GPxxx` (Pascal):** GTX 1080 Ti, GTX 1080, GTX 1070, GTX 1060, GTX 1050 Ti, GT 1030, Quadro P5000, Quadro P1000
* **`GMxxx` (Maxwell):** GTX 980 Ti, GTX 980, GTX 970, GTX 960, GTX 750 Ti, GTX 750, Quadro M5000M, Quadro M2000

### 🟠 Legacy 470xx Drivers (`nvidia-470xx-dkms`)
* **`GKxxx` (Kepler):** GTX 780 Ti, GTX 770, GTX 680, GTX 660, Quadro K5000, Quadro K2000

### 🔴 Legacy 390xx Drivers (`nvidia-390xx-dkms`)
* **`GFxxx` (Fermi):** GTX 580, GTX 560 Ti, GTX 480, GTX 460, Quadro 4000, Quadro 600

---

## ⚠️ Required System Packages for Legacy Branches

When targeting a legacy branch like **580xx**, all driver ecosystem utilities must be pinned to the same version branch to avoid dependency conflicts during system upgrades. Make sure the following matching AUR packages are selected together:

* **DKMS Kernel Module:** `nvidia-580xx-dkms`
* **Userland Utilities:** `nvidia-580xx-utils`
* **32-bit Compatibility Layer:** `lib32-nvidia-580xx-utils` *(Required for Steam / Wine if Multilib is active)*

# and yes made this with google Gemini.
