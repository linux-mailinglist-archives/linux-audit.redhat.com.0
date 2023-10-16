Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EA47C9FDC
	for <lists+linux-audit@lfdr.de>; Mon, 16 Oct 2023 08:46:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697438776;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=O7xxx/V0pOs6YhpNZUsMgGvSGBz89os/i3DbX6zIg40=;
	b=h26opRENWNWidc6dTvQHEsids7Duq9YVyKjk8qDUN8hZZ8fCi/ucZWAy4EEbmhBXIlHoBJ
	u6Wl8bKphRuoP658UEy2R0Fux+ylSTktTO6hRd+oCH664TCAJRV5mxTNaWxbw4tXFuMQsd
	W5IaynRKOInm0A42taQ+5aYU8mpH3eM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-RJsiIwNHN4yE0U1Bxnh1Hw-1; Mon, 16 Oct 2023 02:46:12 -0400
X-MC-Unique: RJsiIwNHN4yE0U1Bxnh1Hw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4678E3C1CC22;
	Mon, 16 Oct 2023 06:46:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C855C15BB8;
	Mon, 16 Oct 2023 06:46:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 017241946595;
	Mon, 16 Oct 2023 06:45:59 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1DDC51946587 for <linux-audit@listman.corp.redhat.com>;
 Mon, 16 Oct 2023 06:45:57 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 071802157F5B; Mon, 16 Oct 2023 06:45:57 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F33802157F5A
 for <linux-audit@redhat.com>; Mon, 16 Oct 2023 06:45:56 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D43881C0690F
 for <linux-audit@redhat.com>; Mon, 16 Oct 2023 06:45:56 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-zoVwxnwtPT2Rd3N2jcWxPg-1; Mon, 16 Oct 2023 02:45:52 -0400
X-MC-Unique: zoVwxnwtPT2Rd3N2jcWxPg-1
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-507a98517f3so1116997e87.0; 
 Sun, 15 Oct 2023 23:45:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697438751; x=1698043551;
 h=content-transfer-encoding:in-reply-to:from:cc:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DTmj2+bY21PR6HlOenmJg/EFzUrksFecdUN+kK/ylUM=;
 b=XKBrnAEtX4l5Dpee3Pz5lYH4FpCCY9lAUFlAN8exYj7fFtYZTH2I3svc+al4Klg+qg
 I598XgU/cBrEVJ/yJbkQK+b6tJuXMgV7vxEGUzJN1APEt90yCp9ut3XLb2f68R7V8Xsh
 z/haYLq5vn2h6KKuBlcK0JnWWVUqfT634cyfvfVwboJr1zjauJZOKkat5NQWk/2iDxE+
 UVx61jJH2kKJe1O0xsdYrzYF1wYX0OSZHldlCAhQ2y7M5flPCEJ2PAB4FUsOtsonRdSq
 zMFopFzO+d9vz0Y+pirSceLKQi78peqQzeT4d50JycLGYSezduIVPJxDzGRIyCfd4zdA
 oCcQ==
X-Gm-Message-State: AOJu0YwcBZWBppNeBGOrLlEmo2xiZ4WDT/0Ztnjak4KbUoPuv1XMh2W3
 V8svKDica1B2xdxkMs7qr4Gm7PczoN4=
X-Google-Smtp-Source: AGHT+IGLKaeTUQBrXYvcigD/SKlnhmBUMTruSm8SuUCxfUUqGK1hCJAh0PXZsQpKyj995bRVRxBmFg==
X-Received: by 2002:a05:6512:3050:b0:503:653:5711 with SMTP id
 b16-20020a056512305000b0050306535711mr31779638lfb.9.1697438750521; 
 Sun, 15 Oct 2023 23:45:50 -0700 (PDT)
Received: from [192.168.0.31] (68.pool-157.kaluga.ru. [62.148.157.68])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a056512071400b00504211d2a73sm903991lfs.230.2023.10.15.23.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Oct 2023 23:45:50 -0700 (PDT)
Message-ID: <48a39e97-a3ea-4e54-a24b-ccef4fc171f9@gmail.com>
Date: Mon, 16 Oct 2023 09:45:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Need help with af_unix audisd plugin
To: Steve Grubb <sgrubb@redhat.com>
References: <bf7effcc-c1b3-4294-8070-dc17548f0366@gmail.com>
 <2733163.mvXUDI8C0e@x2>
From: Rinat Gadelshin <rgadelsh@gmail.com>
In-Reply-To: <2733163.mvXUDI8C0e@x2>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
Content-Language: en-US, ru-RU
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

Steve, thank you so much =)

I suppose you meant `ncat -U --recv-only` due to `nc` doesn't have 
`--recv-only` option.
ncat works as expected (shows incoming audit messages).

Regards
Rinat

On 14.10.2023 00:42, Steve Grubb wrote:
> Hello,
>
> On Tuesday, October 10, 2023 11:53:06 AM EDT Rinat Gadelshin wrote:
>> Could I ask your help with the plugin?
> The mail list might get a faster response. I sometimes get busy.
>
>> I try to check it by the following way on my Ubuntu 20.04:
>>
>> - `systemctl stop auditd`
>> - set 'active' parameter to 'yes' (file /etc/audisp/plugins.d/af_unix.conf)
>> - `systecmtl start auditd`
>> - `systemctl status auditd` shows that the service is running.
>> - `auditctl -w /tmp/delme`
>> - `auditctl -l` shows that the rule has been successfully added.
>> - `ls -l /var/run/audispd_events` prints "srwxr-xr-x 1 root root 0 okt
>> 10 18:38 /var/run/audispd_events"
>> - launch `nc -Ul /var/run/audispd_events` in another terminal
>> - `echo 1 > /tmp/delme`
>>
>> Expected result: `nc` has received some audit events for the file.
>> Actual result: `nc` has received nothing.
> nc -U --recv-only /var/run/audispd_events
>
>> Can you tell me what I did wrong?
> See above.
>
> -Steve
>
>

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

