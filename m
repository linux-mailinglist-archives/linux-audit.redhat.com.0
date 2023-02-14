Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F202696DDE
	for <lists+linux-audit@lfdr.de>; Tue, 14 Feb 2023 20:26:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676402785;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0+ahYi1YSnaol3ww9dlo3Zz3lV97y+pSejTiyUrG03U=;
	b=D6Koufp+/wareg/u5h4iqAULYlwCbIQTgKZvj/ZuykWVAQmTcQCM31cfJ3Ho/O75xyl7ND
	rmYpOaJaNn6ixCDvh9VJhaqedY8X6agYNhyUkpF4Rv7T2DzeAYke9fWo7gYKAby1nDqBay
	U8eR8P2YMExu2WFxLlYrGzNbwPWIQCc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-490-vYUOizkdNoGiX1D6D2lk4A-1; Tue, 14 Feb 2023 14:26:22 -0500
X-MC-Unique: vYUOizkdNoGiX1D6D2lk4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96E91802314;
	Tue, 14 Feb 2023 19:26:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E85BD2026D4B;
	Tue, 14 Feb 2023 19:26:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1C61119465A3;
	Tue, 14 Feb 2023 19:26:19 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 324B71946586 for <linux-audit@listman.corp.redhat.com>;
 Tue, 14 Feb 2023 19:26:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 110F0492B16; Tue, 14 Feb 2023 19:26:17 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 08D50492B15
 for <linux-audit@redhat.com>; Tue, 14 Feb 2023 19:26:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF71318E6C4B
 for <linux-audit@redhat.com>; Tue, 14 Feb 2023 19:26:16 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-EPSxFySJN6ea-evbi64bTQ-1; Tue, 14 Feb 2023 14:26:13 -0500
X-MC-Unique: EPSxFySJN6ea-evbi64bTQ-1
Received: by mail-pg1-f178.google.com with SMTP id b22so5697453pgw.3
 for <linux-audit@redhat.com>; Tue, 14 Feb 2023 11:26:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lc2g99As7ITla01876crbM1cyHfwXKcBk0u/sBbwpuc=;
 b=4jpgncLDakmsRU/u/oRRDUmq6KtChV9bVaF/gibhZOlynhDXDDDLvqXrvPrlcgM0ls
 MDEETSI4QZ6Dukomtq/Dg1nQFoTA4avy/DbOSN9twUDNS65DXSgx/8u/XzM/tBCSmRDK
 aSky5ICT2nqIrjkWs35LaxQEO58ungHnt2ef3mU3WQiO/FpB8ed0vE/AHGD6irVkqbfk
 HTSj34dCUeBsqhEV85P0+mFR9ocMWACBTeKT/FB2LQL2rJZqXpKlYD7T4+2qcx+2NzEX
 sDQovuFZj3yKPr3/DDoZ7hpRzDvkyeFoyVBEfRaH3t6wnalo58rkVZ6bbhfCMXluD7DO
 /uEQ==
X-Gm-Message-State: AO0yUKWAHPoofON1CLdEUY3knzoryYTWLKmXDXUO9YepONcPOuGA20RD
 eTFLCp9VbJBWLeXY29mkC880EMHPbL2Cyd1YwqKeALRNSOqF
X-Google-Smtp-Source: AK7set+hhBS2abEI9H1LY6ukIko+6DO/Lls+WPZ8ncoScehgn5gIM0c5FBBSwFQYBemzbdWDcJ19XKHscaLkvwqiLgE=
X-Received: by 2002:a63:34c4:0:b0:4ce:caaa:2696 with SMTP id
 b187-20020a6334c4000000b004cecaaa2696mr80997pga.1.1676402771540; Tue, 14 Feb
 2023 11:26:11 -0800 (PST)
MIME-Version: 1.0
References: <20230214192326.239267-1-paul@paul-moore.com>
In-Reply-To: <20230214192326.239267-1-paul@paul-moore.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 14 Feb 2023 14:26:00 -0500
Message-ID: <CAHC9VhSiVBN_4EKdq3ZFMRQgqKWCHxORt1Ss4W-OUv760tF3yw@mail.gmail.com>
Subject: Re: [PATCH] tests/filter_exclude: euid filtering now possible in
 exclude filter
To: audit@vger.kernel.org, linux-audit@redhat.com
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 14, 2023 at 2:23 PM Paul Moore <paul@paul-moore.com> wrote:
>
> Starting with Steve's audit userspace v3.1, an euid exclude filter no
> longer results in an error.  Adjust the test accordingly.
>
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>  tests/filter_exclude/test | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

As we are nearing the next upstream kernel release I'm going to merge
this right now so the tests continue to run clear (making it easier to
catch other regressions quickly), but if anyone has any concerns over
this patch please still voice them and I'll be sure to fix them up.

> diff --git a/tests/filter_exclude/test b/tests/filter_exclude/test
> index 7a8e3fb..248fc54 100755
> --- a/tests/filter_exclude/test
> +++ b/tests/filter_exclude/test
> @@ -103,7 +103,7 @@ $result = system("auditctl -a exclude,always -F ppid=$ppid >/dev/null 2>&1");
>  ok( $result ne 0 );
>  system("auditctl -d exclude,always -F ppid=$ppid >/dev/null 2>&1");
>  $result = system("auditctl -a exclude,always -F euid=$euid >/dev/null 2>&1");
> -ok( $result ne 0 );
> +ok( $result, 0 );
>  system("auditctl -d exclude,always -F euid=$euid >/dev/null 2>&1");
>  $result =
>    system("auditctl -a exclude,always -F obj_user=$obj_user >/dev/null 2>&1");
> --
> 2.39.1

-- 
paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

