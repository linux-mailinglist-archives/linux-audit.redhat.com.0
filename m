Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 164C3241C0
	for <lists+linux-audit@lfdr.de>; Mon, 20 May 2019 22:07:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB2A63091851;
	Mon, 20 May 2019 20:07:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4EAA7A42A;
	Mon, 20 May 2019 20:07:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B152E1806B15;
	Mon, 20 May 2019 20:07:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4KK6DvW023723 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 20 May 2019 16:06:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C7EFF60C62; Mon, 20 May 2019 20:06:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C296C60BE2
	for <linux-audit@redhat.com>; Mon, 20 May 2019 20:06:09 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BC1B30833BF
	for <linux-audit@redhat.com>; Mon, 20 May 2019 20:05:58 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id w22so7287003pgi.6
	for <linux-audit@redhat.com>; Mon, 20 May 2019 13:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=magitekltd-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=ipiJNG7yD9xM57RChkBGq/wkz92sa++/6Bn6QeT9taE=;
	b=eFVTJw6hoWIUwnSYWFOmHwwwU5rlDKPQRQcxM08ZpSFGLviCtpYZua0z01DTxX5U2Z
	0ByOiwYF/Ub415Z36Zbjpk3qHRU/rQHRt66oazx663K0e8re9wR62RjeTtGLG6nitpN6
	loNQ+a+QQ0SPhhR4dez94hbGskr09ThiOzzb67NH3gAC02w8w96/YQs99jEvKuHh0Ih7
	2tsxH+Cl38ybrHUBVH7Gn9xwkTio/nPomAEW7pioWPUfyU8+yaRz/dfFqwxYVuA8cpXE
	n/DaasUYxNHx5WNLVnNSBmWUJ3IqFnWNZUSj7sLX2jlr+3gkJlMyV2kXY8u8az9UkCkU
	pktg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=ipiJNG7yD9xM57RChkBGq/wkz92sa++/6Bn6QeT9taE=;
	b=j3j2sXfyTbUaehVsmc6uKtZF1VO0omqrt98CFlE1EFCFlO+X/jkQOK5axHCH8RvsV+
	nxvv9eY4jyAYZUZ6SBmKFXTD5MnNDYBbh0mZg+rCb63loHX8QE25YuE5Qpt8OXa0EkBq
	yynSRQq/YBtxg3Jte7AXdpCNt8qXlS65jjTScNgRhP2Wl7cOSHrg84DDT9LFbdqO8QWp
	doQSAS0M5R95kcpyqP5CUROYju/PYho0FbnV5CF3psfYSc4/E1jW+V4ycGTuy5BsXAuZ
	TOl57Gt/cVrGmPBuNvqQ6EwnYrRE6infUKED2fjisxi8LXFObjfgvCBR8rnmh4g0wr9L
	TpEA==
X-Gm-Message-State: APjAAAUZPeSvGY7a9it1X3seHCbsnDt91IDoyRHokZ8sMQQ9F7nvfdDg
	QFqMX26Y5OQz6XcZcjPYdgDX0g3+Bzw=
X-Google-Smtp-Source: APXvYqxvhSqNHRUY8E3SBytocRO/2JZb5iJcq15fXVl19ayczqbcPmxrjzTKeMGChT5gO4V436owRg==
X-Received: by 2002:a63:2118:: with SMTP id h24mr78262788pgh.320.1558382757646;
	Mon, 20 May 2019 13:05:57 -0700 (PDT)
Received: from [192.168.1.159] ([47.187.54.59])
	by smtp.gmail.com with ESMTPSA id
	o66sm21756247pfb.184.2019.05.20.13.05.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 13:05:57 -0700 (PDT)
Subject: Re: useradd question
To: Steve Grubb <sgrubb@redhat.com>
References: <d3d7fc57-c368-9d01-aae5-cb5469cd2334@magitekltd.com>
	<1666978.mmmlVrCjaM@x2>
	<50add8c3-88c7-5f67-5ece-39fd92f1e646@magitekltd.com>
	<2786293.P8e7BSF5A5@x2>
From: Lenny Bruzenak <lenny@magitekltd.com>
Message-ID: <75873a5b-255c-9b31-1b0e-6a1552021ab1@magitekltd.com>
Date: Mon, 20 May 2019 15:05:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <2786293.P8e7BSF5A5@x2>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 20 May 2019 20:05:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Mon, 20 May 2019 20:05:58 +0000 (UTC) for IP:'209.85.215.179'
	DOMAIN:'mail-pg1-f179.google.com'
	HELO:'mail-pg1-f179.google.com' FROM:'lenny@magitekltd.com' RCPT:''
X-RedHat-Spam-Score: -0.008  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_NONE) 209.85.215.179 mail-pg1-f179.google.com 209.85.215.179
	mail-pg1-f179.google.com <lenny@magitekltd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 20 May 2019 20:07:53 +0000 (UTC)

On 5/20/19 2:59 PM, Steve Grubb wrote:

> So...I went digging through the source code of useradd.c. In main is this 
> comment:
>
>         /*
>          * Do the hard stuff:
>          * - open the files,
>          * - create the user entries,
>          * - create the home directory,
>          * - create user mail spool,
>          * - flush nscd caches for passwd and group services,
>          * - then close and update the files.
>          */
>
> If you dig around, you'll see in the above process it calls usr_update(). 
> This is where the audit event is. The very next function call is close_files. 
> This is where it actually writes to the files where it would be visible to 
> auditd. So, it looks like auditing in shadow-utils is busted.
>
> I also see where its calling pam_tally2 which is deprecated for years. It 
> should be calling faillock. I'll chat with upstream maintainers.
>
> -Steve


Thank you Steve, much appreciated! If they are able to provide a patch,
would you mind asking them to send me a link and I'll test it ASAP?

LCB

-- 
Lenny Bruzenak
MagitekLTD

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit
