# *****************************************************************************
#
# File:        script-variables.ps1
#
# Description: Sets variables used in other scripts.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# 
# *****************************************************************************

# Azure region.
$location = "canadacentral"
$locationName = "Canada Central"

# Resource Group name.
$resourceGroupName = "rim-demo-formrecog"
$resourceGroupRawName = "rimdemoformrecog"

# Application Insights Component name.
$appInsightsComponentName = "$resourceGroupName-appi"

# Container App Environment name.
$containerAppEnvironmentName = "$resourceGroupName-contappenv"

# Container Registry name.
$containerRegistryName = "$resourceGroupRawName" + "acr"

# Cosmos DB Database Account name.
$cosmosDbAccountName = "$resourceGroupName-cosmos"

# Cosmos DB Database name.
$cosmosDbDatabaseName = "FormRecog"

# Log Analytics Workspace name.
$logAnalyticsWorkspaceName = "$resourceGroupName-law"