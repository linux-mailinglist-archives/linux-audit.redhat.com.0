Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87ACB6A5C10
	for <lists+linux-audit@lfdr.de>; Tue, 28 Feb 2023 16:36:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677598587;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=Bhv2TJI3rCiFmaVcpeCbsrDahkH57KYMGm3Bx5Md0xc=;
	b=Pg6wGbR7EdxzxL1ZpSMg2m2GRixnxNKuwhMg2kK+iR9aPgzzwvOIlOZyiVIxsynI/h4itw
	99cwK5fVIwXO9LJTevJhcv2rxPF7DTg8Im79JajeVGwHH5m0jRQiOiy+ha063D9fqMRca7
	0LxPfygl/DAhUs7HFwnX/hgBZGl8MU4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-cjXMXbXlNyeehS_qN_ocPw-1; Tue, 28 Feb 2023 10:36:25 -0500
X-MC-Unique: cjXMXbXlNyeehS_qN_ocPw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E139685A5A3;
	Tue, 28 Feb 2023 15:36:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC62FC15BAD;
	Tue, 28 Feb 2023 15:36:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 116D319465A3;
	Tue, 28 Feb 2023 15:36:13 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 93180194658C for <linux-audit@listman.corp.redhat.com>;
 Tue, 28 Feb 2023 15:35:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EFE542026D68; Tue, 28 Feb 2023 15:35:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8D352026D4B
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 15:35:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08D763813F30
 for <linux-audit@redhat.com>; Tue, 28 Feb 2023 15:35:31 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-171-dzzG9ghaOfaImYo4wDt9Kg-2; Tue, 28 Feb 2023 10:35:28 -0500
X-MC-Unique: dzzG9ghaOfaImYo4wDt9Kg-2
Received: by mail-ua1-f48.google.com with SMTP id e27so1420954uan.4
 for <Linux-audit@redhat.com>; Tue, 28 Feb 2023 07:35:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=apkP6gzdnlfxFLRuoY+h9JutfmA//OB5p3vloRR493Y=;
 b=irVoLWEIKp5I/U1gWQBybWp2Q0iyEITohHqRDGHdGT+SvQBoEtD3VwW36WIdik/CZ1
 NcrTW4vUCTpe/yxxErYrjyRAKkQVxHrw5PTv0AygPReHM0cnvanOqT0thmWk+nJcoxwa
 3kSRxPt41YOE9og3g82B70nGIeFNnIbNhu364YEqrqBCdMyu3T3SxElY/pjyyS++ELYd
 zewznSXS43UMJ7sOdqoFjehWBqZN1uZxOuHH8NQc15TQs9TAYyTftamWKXEvJzFiAFKA
 4bmd0v3gPvTpuRWQWI/qch/JaxjyhNPMirpZRTDLqZuuIC+S15aRkoQIh7W/rAqxmLv3
 qqiw==
X-Gm-Message-State: AO0yUKWTPjEJZHe3qxrfnbqB+od2F0U/RraopEf3ffhxB5wns2C1XsXI
 Sc4vPOlnyoMRZjZSRnaYAwIwFWj04UFZq7u1XJSDLqN3
X-Google-Smtp-Source: AK7set8e1a44u7gFpHxSH1YH2f0xkco0e29cUfUOpSiZLhsThaQeVhqPup2WJAZR9NaHUrynAmn44tcuRZZdFieeJoc=
X-Received: by 2002:ab0:6ed3:0:b0:68b:716e:ed8a with SMTP id
 c19-20020ab06ed3000000b0068b716eed8amr3088907uav.0.1677598527857; Tue, 28 Feb
 2023 07:35:27 -0800 (PST)
MIME-Version: 1.0
References: <CAPoNrttQKG1uiUx=v6Cj8U0MnYMoU-ZP_Htmxn7F_Q7ZdUc9RA@mail.gmail.com>
 <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
In-Reply-To: <CAHC9VhQAFgv5e3rvoaDTnQvQOoGawoAUfcRonayEwrvJu6znBg@mail.gmail.com>
From: Anurag Aggarwal <anurag19aggarwal@gmail.com>
Date: Tue, 28 Feb 2023 21:05:17 +0530
Message-ID: <CAPoNrtswDzsghShzAvf72xOQ-vWUj6DdkVPRWnBWp-qG9Xa8Vw@mail.gmail.com>
Subject: Re: Key based rate limiter (audit_set_rate_limit)
To: Paul Moore <paul@paul-moore.com>
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
Cc: Linux-audit@redhat.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="===============0435895114342825128=="

--===============0435895114342825128==
Content-Type: multipart/alternative; boundary="00000000000054289205f5c458a7"

--00000000000054289205f5c458a7
Content-Type: text/plain; charset="UTF-8"

Hello Paul,

Thank you for your information.


> If you have a particular audit
> rule which is too verbose *and* you are willing to lose audit records
> from that filter rule (which is what would happen if they were rate
> limited), you might want to consider making that audit filter rule
> more targeted to the event you are interested in logging.  Generating
> more audit records than you want to see can be a sign of an overly
> general audit rule.
>

I agree that having rules which are too verbose is not a very good idea.

Beside this, is there any other mechanism which we can use to get a similar
effect?

-- 
Anurag Aggarwal

--00000000000054289205f5c458a7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Paul,</div><div dir=3D"ltr"><br></d=
iv><div>Thank you for your information.</div><div class=3D"gmail_quote"><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">If you have=
 a particular audit<br>
rule which is too verbose *and* you are willing to lose audit records<br>
from that filter rule (which is what would happen if they were rate<br>
limited), you might want to consider making that audit filter rule<br>
more targeted to the event you are interested in logging.=C2=A0 Generating<=
br>
more audit records than you want to see can be a sign of an overly<br>
general audit rule.<br></blockquote><div><br></div><div>I agree that having=
 rules which are too verbose is not a very good idea.=C2=A0</div><div><br><=
/div><div>Beside this, is there any other mechanism which we can use to get=
 a similar effect?=C2=A0</div></div><div><br></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature">Anurag Aggarwal<br></div></div>

--00000000000054289205f5c458a7--

--===============0435895114342825128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

--===============0435895114342825128==--

