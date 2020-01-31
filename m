Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id ECBFA14E771
	for <lists+linux-audit@lfdr.de>; Fri, 31 Jan 2020 04:18:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580440716;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JEQZzqhJWltsJwkS8NyhQ6uP8waWCUl88xBjullIR1Y=;
	b=N7RebA/aI4MnNTRx8cCf5Jacu0anFSy/MuW09uqtdgi/1ZBREBaqw5oM/E3o6jmWjNT3X1
	e0Z4pG/D2gS1eZ+9ufLHf5hglvbpNzG5Y3SIqZ3tU+xPsJ6DVmbWOymzqDNVVqz3Bld00Z
	iw6U4RA5xkXIrjJFm+QIeeygjqUBCFQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-dI3uvjl4N9a1dsrTc-OS5A-1; Thu, 30 Jan 2020 22:18:34 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D1EE68014D0;
	Fri, 31 Jan 2020 03:18:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E53D60BE2;
	Fri, 31 Jan 2020 03:18:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1FC8218089C8;
	Fri, 31 Jan 2020 03:18:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00V3IEL3019795 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 22:18:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8C8471054F91; Fri, 31 Jan 2020 03:18:14 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86A941054F94
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:18:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5AD18013A3
	for <linux-audit@redhat.com>; Fri, 31 Jan 2020 03:18:12 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-166-6UvOPtNTMjK0cnApfF_EDw-1; Thu, 30 Jan 2020 22:18:08 -0500
Received: by mail-ed1-f65.google.com with SMTP id r18so6264553edl.1
	for <linux-audit@redhat.com>; Thu, 30 Jan 2020 19:18:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2UFuNa0uGTLSS1K01AHJXT4Immh/ilmwx1a5+JX2kzY=;
	b=QheSTtrO+gNFPv2S5Y4EL/hlRmIz04RXpqX63jrN6QVOY2nVUvtw/8NWb6VJfs8sjp
	ZrvHkRy+0l8qUjpcPaZHNMn/iWqyAYWVaJPMC4xGjIMYtoEGIkDPhpvYj9YltzH9l1Lr
	OsSGvxI5pT3k3tDwt4ElX/p+vxs70BG+gdk2oWtd7VV71xAE/sqECBbIyXUsEfSkXETf
	1TQsIegDmxxKRCUTlnFMFHsm8g+5+1xzPvbDoo5fjFeE00xkzGV2rTnHNWxRdp23zC3X
	gL6B24V85rulEkaLxNCzwglvqmWj8yyoWnQuPB6t35p9Uo6/kkU7fs2xldbMw+9UwQNi
	dywA==
X-Gm-Message-State: APjAAAV635Aom3v9oOer7y5jG4rZwv6iojuRuoadFxM57N4uHBooivWK
	+svG2m+tZcmNgx+tfTwQxqkUpEEm1BXIhq9bEcg1
X-Google-Smtp-Source: APXvYqxZYRdy66YBGdH/VpIt3ZboIykO9cetzPypkFQfg4TUGmTfhLVz2mVM4N1TFUn6xMYy7WmQgJiTKAg/wHr3E28=
X-Received: by 2002:aa7:cd49:: with SMTP id v9mr6686444edw.269.1580440687367; 
	Thu, 30 Jan 2020 19:18:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577830902.git.rgb@redhat.com>
	<7df83e229cff2518e73425cdc712505fb773a9c2.1577830902.git.rgb@redhat.com>
In-Reply-To: <7df83e229cff2518e73425cdc712505fb773a9c2.1577830902.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 Jan 2020 22:17:56 -0500
Message-ID: <CAHC9VhR=KOAJz5F1XtqSiQkX7c90qCf6dzwZp+j+BTL=sfwTFg@mail.gmail.com>
Subject: Re: [PATCH ghak25 v2 3/9] netfilter: normalize ebtables function
	declarations II
To: Richard Guy Briggs <rgb@redhat.com>
X-MC-Unique: 6UvOPtNTMjK0cnApfF_EDw-1
X-MC-Unique: dI3uvjl4N9a1dsrTc-OS5A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00V3IEL3019795
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, ebiederm@xmission.com,
	twoerner@redhat.com, Eric Paris <eparis@parisplace.org>,
	tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 6, 2020 at 1:55 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Align all function declaration parameters with open parenthesis.
>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
>  net/bridge/netfilter/ebtables.c | 27 ++++++++++++++-------------
>  1 file changed, 14 insertions(+), 13 deletions(-)

My comments from the first patch regarding style changes also applies here.

--
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

