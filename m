Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AB480269CF
	for <lists+linux-audit@lfdr.de>; Wed, 22 May 2019 20:27:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDF188666F;
	Wed, 22 May 2019 18:27:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F7135D6A9;
	Wed, 22 May 2019 18:27:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 13E2A54D3D;
	Wed, 22 May 2019 18:27:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4MIO3UD026108 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 22 May 2019 14:24:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9FB654474; Wed, 22 May 2019 18:24:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D309B544ED
	for <linux-audit@redhat.com>; Wed, 22 May 2019 18:24:01 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
	[209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E6E078112A
	for <linux-audit@redhat.com>; Wed, 22 May 2019 18:23:45 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id g21so1481108plq.0
	for <linux-audit@redhat.com>; Wed, 22 May 2019 11:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=magitekltd-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=qFZ5NmwX+U1ShKlYwhPLLF0JFitHzMYvR+Fgy2mQxl0=;
	b=KNhB8m6/JpJ2Uvf6cRAWaKvGPhTWzuON2ZnYP+zFmB7OGH7kvchYtev64oj+UW4fR9
	p6YCa4B2czOVcOodf0NJp7GfMymQHCzWvLxYx9TAtjANKDbkUdtLhntm3wVNQnInNoAA
	L4VJcc8VvCMrfbzsCXA1UhRVHXqCjUqVzrZRDkl3Woy3ZdRKxzUwYDfg6AIN+7Qftt2a
	rM6wDjaJK51NygtAFbnktoNRRuXSlut0uh627DH6BzLZFc6NfOUqZ7GfKhMeW+i3YRVg
	J/d06K5kk4jm5jt6rOPJbeQ9kxj/dfqLFLWlm1bkN8BRUQGGppi/8zrZYx9VfXcWCHYf
	HpTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=qFZ5NmwX+U1ShKlYwhPLLF0JFitHzMYvR+Fgy2mQxl0=;
	b=ueiqBC/wWlItzvfOAFa1GFZQVvB8zretJqjpRBQbhuRwTSsIi5WTwJbJU46fCRxoJW
	0vtp8pAQND8saQzA05B1vtofWoZ4oKGA2gRwZhkK1PtbftOezdWgYodvblpAfJdxk2Ci
	l/vXCu3EQVG/VDn8EKvk/Cn/l9D+XdU3+R9apvR0I1PnmA0eb368OZ7/AYCNsyzT2UKg
	b/O+jQFkr1VPe7mXxzC0qg+z4wxPezwNDmNu3VztVbAygRWfP5enl2AfGvQG7JvfKkOw
	8G18mzunsNty83LSGrpY2edjnapia277yXUqQJA3wgqp4va7fgNjg1Eyr3kUhJGLYafS
	1tlw==
X-Gm-Message-State: APjAAAWpoFtZokHtkiSwzVeL7oS1qMH3DMpZy/7X7eG0w8lxuiwXrQHu
	JkwqkKCRoOsK9RH4dDm/8BidOEhb4AA=
X-Google-Smtp-Source: APXvYqxsc9lrVKaYBsINAP55W+0HUL0GOnwcT/c3pjymuGbUj9T8jDTK8Cn13V57bt2OwhpP8RjSLA==
X-Received: by 2002:a17:902:7581:: with SMTP id
	j1mr8386588pll.23.1558549425384; 
	Wed, 22 May 2019 11:23:45 -0700 (PDT)
Received: from [192.168.1.159] ([47.187.49.212])
	by smtp.gmail.com with ESMTPSA id
	o6sm22182888pfo.164.2019.05.22.11.23.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 22 May 2019 11:23:43 -0700 (PDT)
Subject: Re: useradd question
To: Steve Grubb <sgrubb@redhat.com>
References: <d3d7fc57-c368-9d01-aae5-cb5469cd2334@magitekltd.com>
	<2786293.P8e7BSF5A5@x2>
	<75873a5b-255c-9b31-1b0e-6a1552021ab1@magitekltd.com>
	<1895815.SLc6sCx9v7@x2>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <7643eb69-f193-4b95-6716-c4e9260e9785@magitekltd.com>
Date: Wed, 22 May 2019 13:23:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1895815.SLc6sCx9v7@x2>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 22 May 2019 18:23:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Wed, 22 May 2019 18:23:46 +0000 (UTC) for IP:'209.85.214.177'
	DOMAIN:'mail-pl1-f177.google.com'
	HELO:'mail-pl1-f177.google.com' FROM:'lenny@magitekltd.com' RCPT:''
X-RedHat-Spam-Score: 0.191  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	SPF_NONE) 209.85.214.177 mail-pl1-f177.google.com
	209.85.214.177 mail-pl1-f177.google.com <lenny@magitekltd.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-audit>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-audit>,
	<mailto:linux-audit-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Wed, 22 May 2019 18:27:38 +0000 (UTC)

On 5/22/19 12:34 PM, Steve Grubb wrote:

> I think this is the right fix:
>
> diff -urp shadow-4.6.orig/src/useradd.c shadow-4.6/src/useradd.c
> --- shadow-4.6.orig/src/useradd.c       2019-05-21 08:26:12.533328554 -0400
> +++ shadow-4.6/src/useradd.c    2019-05-22 12:21:46.305293997 -0400
> @@ -1955,9 +1955,14 @@ static void usr_update (void)
>  #endif                         /* ENABLE_SUBIDS */
>
>  #ifdef WITH_AUDIT
> +       /*
> +        * Even though we have the ID of the user, we won't send it now
> +        * because its not written to disk yet. After close_files it is
> +        * and we can use the real ID thereafter.
> +        */
>         audit_logger (AUDIT_ADD_USER, Prog,
>                       "add-user",
> -                     user_name, (unsigned int) user_id,
> +                     user_name, AUDIT_NO_ID,
>                       SHADOW_AUDIT_SUCCESS);
>  #endif
>         /*

I tested this and it looks good. Thanks Steve, I really appreciate the help.

LCB

-- 
Lenny Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
