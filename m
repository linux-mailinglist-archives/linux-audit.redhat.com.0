Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9CC280884
	for <lists+linux-audit@lfdr.de>; Thu,  1 Oct 2020 22:35:42 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-mESekBX_M1-sG9140cRWVQ-1; Thu, 01 Oct 2020 16:35:39 -0400
X-MC-Unique: mESekBX_M1-sG9140cRWVQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79D5A8030BE;
	Thu,  1 Oct 2020 20:35:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 252B910013BD;
	Thu,  1 Oct 2020 20:35:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C927B44A4C;
	Thu,  1 Oct 2020 20:35:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 091KXp9Y019850 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 1 Oct 2020 16:33:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA29E10FF0B; Thu,  1 Oct 2020 20:33:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4BB410FF05
	for <linux-audit@redhat.com>; Thu,  1 Oct 2020 20:33:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5175811E7A
	for <linux-audit@redhat.com>; Thu,  1 Oct 2020 20:33:49 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-31-EcRx2GXXMcGhvUCH9SYlaA-1; Thu, 01 Oct 2020 16:33:46 -0400
X-MC-Unique: EcRx2GXXMcGhvUCH9SYlaA-1
Received: by mail-ej1-f66.google.com with SMTP id q13so9986218ejo.9
	for <linux-audit@redhat.com>; Thu, 01 Oct 2020 13:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qqD5414H2vh/oHhxr4gWzyumwIRB3ByZyFQXRFv8xkI=;
	b=WmOHx5xtIGNDwoFdOCaosn3Fpa69dqCr9HuQk31hFJanKaoNITDxSg9+xzBVjaY9Rp
	ZG6vVXKucazrkO12OhORYeDMl4rhCyJ0cuzfA00KQoOLjBTGiN2WB77lMvrT7TsixjJJ
	WWBcJzktzjPu0s8j+xxKjwdzQY82i+8HD1nNi+vhJWZu2ig2DjWM3imaBFL4GVDeLHEl
	iWQ34WYKdIJhKdIbqPNzCokcrnfYomnPGkAFNsJp5sMX5Uv7atbgP4y/5l4cGu/imIu6
	+7/kzHkwwuG9QIdGcxuaAJiJcBRLxV5cxxZQrCeTbw4P0Mnp4SQzil2q3+r5JUGzssk+
	JQMw==
X-Gm-Message-State: AOAM533nYgKpSTLgrbPjcpIBjN3xZn1VjDr3DeF6V0kwRa33nX/PanDw
	UTpBm4dwYZM2pMI/++II3bm1Ibxud5VuD9Hnb2Yy
X-Google-Smtp-Source: ABdhPJxll4xsFxxmUGYi+l9TqLqMqug55YxXTtXDOkeoST+CE1sfprMbYfpBRw4R7McWr1tZJWrcxaQqRohIqfrQWmU=
X-Received: by 2002:a17:906:14ca:: with SMTP id
	y10mr9861383ejc.542.1601584424728; 
	Thu, 01 Oct 2020 13:33:44 -0700 (PDT)
MIME-Version: 1.0
References: <2745105.e9J7NaK4W3@x2> <20201001101219.GE17860@quack2.suse.cz>
	<20201001102419.GF17860@quack2.suse.cz>
In-Reply-To: <20201001102419.GF17860@quack2.suse.cz>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 1 Oct 2020 16:33:33 -0400
Message-ID: <CAHC9VhQoc+wXqyQ76bjjYKR+KhMaj7K_p8vEh1=nR_RPMvN2Ww@mail.gmail.com>
Subject: Re: [PATCH 2/3] fanotify: define bit map fields to hold response
	decision context
To: Jan Kara <jack@suse.cz>, Steve Grubb <sgrubb@redhat.com>
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
Cc: linux-fsdevel@vger.kernel.org, linux-audit@redhat.com,
	Amir Goldstein <amir73il@gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-audit-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 1, 2020 at 6:24 AM Jan Kara <jack@suse.cz> wrote:
> On Thu 01-10-20 12:12:19, Jan Kara wrote:
> > On Wed 30-09-20 12:12:28, Steve Grubb wrote:
> > > This patch defines 2 bit maps within the response variable returned from

Please use "bitmaps" instead of "bit maps".

> > So how likely do you find other context types are or that you'd need to
> > further expand the information passed from userspace? Because if there are
> > decent changes the expansion will be needed then I'd rather do something
> > like:
> >
> > struct fanotify_response {
> >       __s32 fd;
> >       __u16 response;
> >       __u16 extra_info_type;
> > };
> >
> > which is also backwards compatible and then userspace can set extra_info_type
> > and based on the type we'd know how much more bytes we need to copy from
> > buf to get additional information for that info type.
> >
> > This is much more flexible than what you propose and not that complex to
> > implement, you get type safety for extra information and don't need to use
> > macros to cram everything in u32 etc. Overall cleaner interface I'd say.

Yes, much cleaner.  Stealing bits from an integer is one of those
things you do as a last resort when you can't properly change an API.
Considering that APIs always tend to grow and hardly ever shrink, I
would much prefer Jan's suggestion.

> Now I realized we need to propagate the extra information through fanotify
> permission event to audit - that can be also done relatively easily. Just
> add '__u16 extra_info_type' to fanotify_perm_event and 'char
> extra_info_buf[FANOTIFY_MAX_RESPONSE_EXTRA_LEN]' for now for the data. If
> we ever grow larger extra info structures, we can always change this to
> dynamic allocation but that will be only internal fanotify change,
> userspace facing API can stay the same.

That fanotify/audit interface doesn't bother me as much since that is
internal and we can modify that as needed; the userspace/kernel
fanotify API and the audit record are the important things to focus
on.

Simply recording the "extra_info_type" integer and dumping the
"extra_info" as a hex encoded bitstring in the audit record is
probably the most future proof solution, but I'm not sure what Steve's
tooling would want from such a record.  It also seems to be in the
spirit of Steve's 3/3 patch.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

