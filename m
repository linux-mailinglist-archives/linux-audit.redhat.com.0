Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B90BE6A87D4
	for <lists+linux-audit@lfdr.de>; Thu,  2 Mar 2023 18:24:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677777898;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=wEifZ0RM8BqUukdlmjXuPybivXbDFtSuLVPsGO6yCdY=;
	b=d3bd62DoTVWfTGmLleDZJyU9zjBO9CoJ1OVURLQjtDGCib2KYyetb/sjbpBiPQzQzIfElb
	eXjOwcADAxMi8H5MOiUQrlApCWAcfxmlHNKehaP8v+I5p2LdznACp2ITJvV9qwCR6+scU1
	qtUdfJ1qfzrDMRG99IDTrDAWvORmgD4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-ZQPYyg1nMbuOcK-R7BcYaA-1; Thu, 02 Mar 2023 12:24:55 -0500
X-MC-Unique: ZQPYyg1nMbuOcK-R7BcYaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98B45800050;
	Thu,  2 Mar 2023 17:24:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B2C54010E86;
	Thu,  2 Mar 2023 17:24:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 331C11948642;
	Thu,  2 Mar 2023 17:24:40 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5A30619452CD for <linux-audit@listman.corp.redhat.com>;
 Thu,  2 Mar 2023 17:24:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 19C6F2026D4B; Thu,  2 Mar 2023 17:24:18 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 113F02026D2A
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 17:24:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA4351C05AD5
 for <linux-audit@redhat.com>; Thu,  2 Mar 2023 17:24:17 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-3CT0k022OK69k9T0m8AYEw-1; Thu, 02 Mar 2023 12:24:15 -0500
X-MC-Unique: 3CT0k022OK69k9T0m8AYEw-1
Received: by mail-io1-f48.google.com with SMTP id q6so7035533iot.2
 for <linux-audit@redhat.com>; Thu, 02 Mar 2023 09:24:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677777855;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WcOquWhTdunERydwgdig69GwjNF48M/ZAT30l3rQ02o=;
 b=0yI84YsjVZkcYIekawGxJWsNcj0YPyb7kYeppeSlqVTaSl+T4Kkl/NY0kj54dgXLA5
 5efNI1n792CmgRdvS3Anh+EUX3HNuLHINAYUPHshw1RK76eTH38zIg1tjPiZs2BBFMqg
 gT5Z50BOVXXHETVcsCjSx48dCwEKKke0krrJPmzA4wj55LfOujuP1pNGxRF374tNRBeq
 WOq8qG+wz4QMwTW2Jp0LxOUCnNm/9bNQu9D6blAO3Vzum8qvTwQfrv6fRx/GviGebrPO
 WDxjyUb6J6hDq2evGKWOBrdBhXAJRycrxvvP3yKElB8oOVFCN5XGWn4Jmt0UZx31LA5L
 5a3A==
X-Gm-Message-State: AO0yUKWLtO91uMF0qEBs4LCvu3uYYYrmX81F5o8wwXTJIhqiwWeWFJpp
 xwQ6+anVyM/wmy0fOqLu4wKYtYURRePFLQIZpB0=
X-Google-Smtp-Source: AK7set8m9gcmoaCab0Dv3AkdxhJutrNPwQzYfVQ2up5xNGq37n3TnOue25++j6mweDaarqfQEYY4dA==
X-Received: by 2002:a5d:8051:0:b0:74c:a93d:a41d with SMTP id
 b17-20020a5d8051000000b0074ca93da41dmr7654320ior.10.1677777854880; 
 Thu, 02 Mar 2023 09:24:14 -0800 (PST)
Received: from [192.168.0.143] ([206.85.149.8])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a92c608000000b0031798b87a14sm1333897ilm.19.2023.03.02.09.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Mar 2023 09:24:14 -0800 (PST)
Message-ID: <ba3891d6-21ed-9e86-6bf9-c049ae8a1b3b@magitekltd.com>
Date: Thu, 2 Mar 2023 10:24:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Key based rate limiter (audit_set_rate_limit)
To: Anurag Aggarwal <anurag19aggarwal@gmail.com>
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
 <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
 <CAPoNrtswDzsghShzAvf72xOQ-vWUj6DdkVPRWnBWp-qG9Xa8Vw@mail.gmail.com>
 <CAHC9VhSr3groyZpA34L3swqDoU8_WJWbWsHz7GDR0QqNpSjhyA@mail.gmail.com>
 <d0c20f21-7064-e199-c052-5d049a681ecf@magitekltd.com>
 <CAPoNrtsiXr=-w5OT0J_i5Ekun0FKVc3Ocs2oY-bAj+ZjvEwCmg@mail.gmail.com>
 <37a373df-97cd-133a-381f-6d6d4b20c3fa@magitekltd.com>
 <CAPoNrtvj1xXDXfgNe=r2ETqYYODqXqYn6LX=w=eGYon1PO2TBA@mail.gmail.com>
From: Lenny Bruzenak <lenny@magitekltd.com>
In-Reply-To: <CAPoNrtvj1xXDXfgNe=r2ETqYYODqXqYn6LX=w=eGYon1PO2TBA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: multipart/mixed; boundary="===============1109219599018024352=="

This is a multi-part message in MIME format.
--===============1109219599018024352==
Content-Type: multipart/alternative;
 boundary="------------9ekb3qQH62FVbrlIzKn7HTBH"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9ekb3qQH62FVbrlIzKn7HTBH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/1/23 22:13, Anurag Aggarwal wrote:

>     Or if selinux is in force, create policy for the events you
>     definitely want, then look for those types (either subject or
>     object) in your rule. This is something I've seen before, where
>     renames that are desired to be audited use the provided system
>     tools, but for locally developed application code, they are made
>     to run inside a certain type of a custom executable and then that
>     type is excluded from the rename syscall rule. Ideally, the code
>     which is written would self-audit a 1-liner like "I am going to
>     rename every file under dir /opt/special/stuff/" using
>     audit_log_user_message so you still have some idea what is
>     happening (if you care).
>
>     Then your "my-rename" program subject type of my_rename_t can be
>     used as an exclude on the rule. Of course, the caller must then
>     know to use this rather than the standard utilities.
>
>
> This sounds useful and might solve our problem, will it be possible to 
> share some examples on how this can be achieved?


Replying off-list as it is not specifically audit-focused. See Paul, I 
CAN learn. 😁

LCB

-- 
Lenny Bruzenak
MagitekLTD

--------------9ekb3qQH62FVbrlIzKn7HTBH
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 3/1/23 22:13, Anurag Aggarwal wrote:<br>
    </p>
    <blockquote type="cite"
cite="mid:CAPoNrtvj1xXDXfgNe=r2ETqYYODqXqYn6LX=w=eGYon1PO2TBA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div class="gmail_quote">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <p>Or if selinux is in force, create policy for the events
                you definitely want, then look for those types (either
                subject or object) in your rule. This is something I've
                seen before, where renames that are desired to be
                audited use the provided system tools, but for locally
                developed application code, they are made to run inside
                a certain type of a custom executable and then that type
                is excluded from the rename syscall rule. Ideally, the
                code which is written would self-audit a 1-liner like "I
                am going to rename every file under dir
                /opt/special/stuff/" using audit_log_user_message so you
                still have some idea what is happening (if you care).<br>
              </p>
              <p>Then your "my-rename" program subject type of
                my_rename_t can be used as an exclude on the rule. Of
                course, the caller must then know to use this rather
                than the standard utilities.</p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>This sounds useful and might solve our problem, will it
            be possible to share some examples on how this can be
            achieved?  </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Replying off-list as it is not specifically audit-focused. See
      Paul, I CAN learn. 😁</p>
    <p>LCB<br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Lenny Bruzenak
MagitekLTD</pre>
  </body>
</html>

--------------9ekb3qQH62FVbrlIzKn7HTBH--

--===============1109219599018024352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============1109219599018024352==--

