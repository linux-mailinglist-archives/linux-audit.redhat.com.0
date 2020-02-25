Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E122F16ED5F
	for <lists+linux-audit@lfdr.de>; Tue, 25 Feb 2020 19:00:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582653604;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7EQoTPuUILL3A1cFIEc77ijEVlGzQPVyTWgP3PhRmcc=;
	b=VdkJBPyt/BXfwYbu8/aawYi06KPCiGJkofAGUp5pLts24R38ypOX1oduk3H/wu2vZC5+P5
	ephXq8mHxTvEYowNdp0lNmH2St0ar3XDU0Toy88DL+cA3AoUMYAj0suaOXniOHwi+zaN2d
	FPojouoGLDK/Iz2UKUIN1xY4KAc4LHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-a2OcKrmCPoe-P1uQPFVTTw-1; Tue, 25 Feb 2020 13:00:01 -0500
X-MC-Unique: a2OcKrmCPoe-P1uQPFVTTw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DDB25801E53;
	Tue, 25 Feb 2020 17:59:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B5C826FB3;
	Tue, 25 Feb 2020 17:59:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2E7518089CD;
	Tue, 25 Feb 2020 17:59:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01PHxpVA028909 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 25 Feb 2020 12:59:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9C9DEF4974; Tue, 25 Feb 2020 17:59:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 987F5F4984
	for <linux-audit@redhat.com>; Tue, 25 Feb 2020 17:59:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31BA280029A
	for <linux-audit@redhat.com>; Tue, 25 Feb 2020 17:59:49 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-141-m--NV69sMP-Lv_JaB7SR3w-1; Tue, 25 Feb 2020 12:59:46 -0500
X-MC-Unique: m--NV69sMP-Lv_JaB7SR3w-1
Received: by mail-ed1-f67.google.com with SMTP id p14so362416edy.13
	for <linux-audit@redhat.com>; Tue, 25 Feb 2020 09:59:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=m7LIyS2zVnyr4ZIKBfFkvlCDgTjsltYHrTVVC1cvZ6c=;
	b=TshY1VgGhj9RLY8Eel+My5u8uL5Hv4Y/asHoIkqkSwnhwrC1MxjM7r530cSkTf3fWu
	T5RC2OQZ71K4luv8XaNtyeu4MmzsyVDCX3rINajS5wy210tu7E0pPPDMKpQBP/ediYbb
	xDjTDN6OnEHuw2wxR9NwQJ1BP+TWlFRy3H8ampbsMdUiE2FFPSEKexBAoKMELWyBJDOZ
	rsfSInvf4PA5uv8+yoeE6gbhXHBMKneApBj4PkSv9sjHanLhaY5QUxSA/cQDZrDynWN/
	28LNDTBwI59eachKIwkIlwWIsqbmvErmpG3u62eLSqswPK7cmEgM0p+1G+3CNRot6Avx
	dGig==
X-Gm-Message-State: APjAAAVwEI2gFlWGHOgXKghxQYEf0oJcZIOu55cf7KttAPkLaZLHL8yD
	P+Z0qPiw6DZA3ihCj4wKqmEQkzeNAdy1YQj8PNKtWsHdUQ==
X-Google-Smtp-Source: APXvYqx5zrq4sDR8ZxypEw+XvZViO5mJe09ZXFqrcKvIzpW4C8z2aKk1T+6lFdHx5Mv37YtsjJ1Ge8ioS0Ydlvvun+M=
X-Received: by 2002:a17:906:c299:: with SMTP id
	r25mr382441ejz.272.1582653584503; 
	Tue, 25 Feb 2020 09:59:44 -0800 (PST)
MIME-Version: 1.0
References: <158265301737.204863.7151355750592428596.stgit@chester>
In-Reply-To: <158265301737.204863.7151355750592428596.stgit@chester>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 25 Feb 2020 12:59:32 -0500
Message-ID: <CAHC9VhQEtU3AVV3xOp4O1JT=i51QvrditwPJXL6JAgKwucJ6TQ@mail.gmail.com>
Subject: Re: [PATCH v2] audit: always check the netlink payload length in
	audit_receive_msg()
To: linux-audit@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01PHxpVA028909
X-loop: linux-audit@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 25, 2020 at 12:50 PM Paul Moore <paul@paul-moore.com> wrote:
>
> This patch ensures that we always check the netlink payload length
> in audit_receive_msg() before we take any action on the payload
> itself.
>
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+399c44bf1f43b8747403@syzkaller.appspotmail.com
> Reported-by: syzbot+e4b12d8d202701f08b6d@syzkaller.appspotmail.com
> Signed-off-by: Paul Moore <paul@paul-moore.com>
> ---
>  kernel/audit.c |   40 +++++++++++++++++++++-------------------
>  1 file changed, 21 insertions(+), 19 deletions(-)

Merged into audit/stable-5.6, assuming there are no problems I'll send
it up to Linus later this week.

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

