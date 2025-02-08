--teste bebee
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/7yhx/kwargs_Ui_Library/main/source.lua"))()

local UI = Lib:Create{
   Theme = "Dark", -- or any other theme
   Size = UDim2.new(0, 555, 0, 400) -- default
}

local Main = UI:Tab{
   Name = "Inicio"
}

local Divider = Main:Divider{
   Name = "Inicio"
}

local QuitDivider = Main:Divider{
   Name = "Sair"
}


local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Substitua 'NomeDaBola' pelo nome correto do objeto bola no seu jogo
local ball = workspace:WaitForChild("Ball")

-- Função para teletransportar a bola até o jogador
local function teleportBall()
    ball.CFrame = player.Character:WaitForChild("HumanoidRootPart").CFrame
end

-- Função para mudar a cor do flow para preta
local function changeFlowColor()
    ball.Color = Color3.new(0, 0, 0) -- Cor preta
end


-- Função para aumentar a hitbox
local function increaseHitbox()
    ball.Size = ball.Size * 2 -- Aumenta a hitbox (tamanho) da bola
end

-- Detectar pressionamento de teclas
mouse.KeyDown:Connect(function(key)
    if key == "e" then
        teleportBall()
    elseif key == "p" then
        changeFlowColor()
    elseif key == "3" then
        changeStyle()
    elseif key == "f" then
        increaseHitbox()
    end
end)
