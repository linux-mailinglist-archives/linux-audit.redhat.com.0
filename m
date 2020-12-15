Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id D78ED2DA646
	for <lists+linux-audit@lfdr.de>; Tue, 15 Dec 2020 03:34:59 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-OcMT7JGGOX-avS-LJBgKZA-1; Mon, 14 Dec 2020 21:34:56 -0500
X-MC-Unique: OcMT7JGGOX-avS-LJBgKZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76699107ACF6;
	Tue, 15 Dec 2020 02:34:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 954735B4A4;
	Tue, 15 Dec 2020 02:34:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D203D180954D;
	Tue, 15 Dec 2020 02:34:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BF2Yc42028135 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 14 Dec 2020 21:34:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B72E41DB38; Tue, 15 Dec 2020 02:34:38 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B16EF1C5B9
	for <linux-audit@redhat.com>; Tue, 15 Dec 2020 02:34:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 762F2185A7BC
	for <linux-audit@redhat.com>; Tue, 15 Dec 2020 02:34:36 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-453-s32xXvcTM8a6KmHFB19Rww-1; Mon, 14 Dec 2020 21:34:32 -0500
X-MC-Unique: s32xXvcTM8a6KmHFB19Rww-1
Received: by mail-ed1-f66.google.com with SMTP id h16so19359591edt.7
	for <linux-audit@redhat.com>; Mon, 14 Dec 2020 18:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SDS1IoTT9e9jG5qNkQs06xUgvZJCIKhgAel2bPuApCE=;
	b=XyqdklT5KVe93kF/2Rot7ZWgsWBe+zDJIGakUxXqbF2AmxpJm3Dq7VLnOfDPKl8izR
	NfaaUV3MQyd3fCO6qUuxra2LY3fpMc8M94efIhyzkjn05jCngJv4dzTsuq+93ToAKDhk
	JkAZoSIzPh+D9iAGsCdrKwFZB3gfogAu/c1jz3oOI0NyImV6ZBhgg4teYs0+7fDVfxYW
	Utt6yj9yP/7jo1fcNU3c8tUUS3n5wa5J9oEzHvXjhlJS7pk2Cfah54Ndd9ZrFcgy651m
	uJeEkAj8sBLyVSRpPoZNoC1OVGeTZYnQ3hL922OXURcBIajIM4SecI4NHDZjtyM74RzV
	wcHg==
X-Gm-Message-State: AOAM532pYOvwPU9VRF4SAjuqpys02d/E5wSrhKBR9c0LkXT8jqc5Vkjf
	MXV06FZvlLV7tDvdc7YyCjjKdWz7XrASE+tZ7Faa
X-Google-Smtp-Source: ABdhPJxB5mO16JID/xZpY5y+REkiQAGxjKT/tvKMyXIFEReGjo7zDWN9vB7Psgey9fhfS5qYIxFBVAwBderGUJp/KuI=
X-Received: by 2002:a05:6402:44b:: with SMTP id
	p11mr27550671edw.164.1607999670809; 
	Mon, 14 Dec 2020 18:34:30 -0800 (PST)
MIME-Version: 1.0
References: <20201211084254.2038-1-zhengyongjun3@huawei.com>
	<20201211153321.GF2015948@madcap2.tricolour.ca>
In-Reply-To: <20201211153321.GF2015948@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 14 Dec 2020 21:34:19 -0500
Message-ID: <CAHC9VhS9zCzWLhwE=6AOr7sO-LUdLDS6sb4tC2tDuT=LRYdzHw@mail.gmail.com>
Subject: Re: [PATCH -next] kernel/audit: convert comma to semicolon
To: Zheng Yongjun <zhengyongjun3@huawei.com>,
	Richard Guy Briggs <rgb@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com, linux-kernel@vger.kernel.org
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
Sender: linux-audit-bounces@redhat.com
Errors-To: linux-audit-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 11, 2020 at 10:33 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-12-11 16:42, Zheng Yongjun wrote:
> > Replace a comma between expression statements by a semicolon.
> >
> > Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> > ---
> >  kernel/audit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 68cee3bc8cfe..c8497115be35 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -2282,7 +2282,7 @@ static void audit_log_set_loginuid(kuid_t koldloginuid, kuid_t kloginuid,
> >
> >       uid = from_kuid(&init_user_ns, task_uid(current));
> >       oldloginuid = from_kuid(&init_user_ns, koldloginuid);
> > -     loginuid = from_kuid(&init_user_ns, kloginuid),
> > +     loginuid = from_kuid(&init_user_ns, kloginuid);
>
> Nice catch.  That went unnoticed through 3 patches, the last two mine...

Yes, thanks for catching this and submitting a patch.  However, as it
came very late in the v5.10-rcX release cycle I'm going to wait until
after this merge window to merge it into audit/next.

> Not quite sure why no compiler complained about it...

Because it is legal; odd, but legal. :)

The comma operator allows multiple expressions to be executed with
only the last expression returned.  Take the example below:

% cat test.c
#include <stdlib.h>
#include <stdio.h>

int main(int argc, char *argv[])
{
       int a, b, c;

       a = (b = 1, c = 2);
       printf("a = %d, b = %d, c = %d\n", a, b, c);

       return 0;
}
% gcc -o test test.c
% ./test
a = 2, b = 1, c = 2

... we see both "b=1" and "c=2" are executed, and the last statement
in the comma separated list of expressions is used as the right-hand
value in the "a" assignment.

In the case of this patch, the existing code is actually okay: both
expressions are executed and we don't assign either expression's value
to a variable so it doesn't matter.  However, it definitely looks odd
and is something we should fix.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

