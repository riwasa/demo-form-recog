# *****************************************************************************
#
# File:        log_analytics.ps1
#
# Description: Creates a Log Analytics Workspace.
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

# Get script variables.
. $PSScriptRoot\..\script_variables.ps1

# Create a Log Analytics Workspace.
Write-Host "Creating a Log Analytics Workspace"

az deployment group create `
  --name "log_analytics" `
  --resource-group "$resourceGroupName" `
  --template-file "$PSScriptRoot\log_analytics.bicep" `
  --parameters "$PSScriptRoot\log_analytics.parameters.json" `
  --parameters logAnalyticsName="$logAnalyticsWorkspaceName" `
               location="$location"