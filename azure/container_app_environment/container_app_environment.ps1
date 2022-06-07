# *****************************************************************************
#
# File:        container_app_environment.ps1
#
# Description: Creates a Container App Environment.
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

# Create a Container App Environment.
Write-Host "Creating a Container App Environment"

az deployment group create `
  --name "container_app_environment" `
  --resource-group "$resourceGroupName" `
  --template-file "$PSScriptRoot\container_app_environment.bicep" `
  --parameters containerAppEnvironmentName="$containerAppEnvironmentName" `
               logAnalyticsName="$logAnalyticsWorkspaceName" `
               location="$location"