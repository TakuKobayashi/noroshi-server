json.array!(@gimmicks) do |gimmick|
  json.partial! 'each', gimmick: gimmick
  json.clear gimmick.stage.clear
end