-- Configuração inicial
local userInputService = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local ball = workspace:WaitForChild("Ball")  -- A bola que o jogador vai driblar ou roubar
local dribbleSpeed = 50 -- A velocidade do drible
local stealRange = 5 -- Distância para roubar a bola

-- Função para o drible
local function dribbleBall()
    -- Verifica se a bola está na frente do jogador
    local direction = character.HumanoidRootPart.CFrame.LookVector
    local newPos = ball.Position + direction * dribbleSpeed

    -- Move a bola para frente simulando um drible
    ball.Velocity = direction * dribbleSpeed  -- Move a bola com velocidade
end

-- Função para roubar a bola
local function stealBall()
    -- Verifica a distância do jogador até a bola
    local distance = (ball.Position - character.HumanoidRootPart.Position).Magnitude

    if distance <= stealRange then
        -- Bola pode ser roubada
        local direction = character.HumanoidRootPart.CFrame.LookVector
        ball.Velocity = direction * dribbleSpeed -- Bola é movida na direção do jogador

        -- Envia uma mensagem no chat do Roblox informando sobre o roubo de bola
        game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents")
            :WaitForChild("SayMessageRequest"):FireServer("Roubo de bola bem-sucedido!", "All")
    end
end

-- Conectar as teclas para os dribles e roubos
userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end

    -- Tecla para fazer o drible
    if input.KeyCode == Enum.KeyCode.E then
        dribbleBall()
    end

    -- Tecla para tentar roubar a bola (tecla F agora)
    if input.KeyCode == Enum.KeyCode.F then
        stealBall()
    end
end)

game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents")
:WaitForChild("SayMessageRequest"):FireServer("Script carregado com sucesso")