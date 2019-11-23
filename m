Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0AB80108EE5
	for <lists+linux-audit@lfdr.de>; Mon, 25 Nov 2019 14:30:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574688645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=INoLnhinNWD60oBj7518ncS9Ky7MQ4EZPz8zmsT95rY=;
	b=GB7ujrALVrjErMNSGshUPhqe50x3pC1RT0mvmv1+vUnDSif8Kpmp0SeThjhVGTOI/JjkZo
	Wz5NxF/w0r3YC80n4679gY5SAGqu/T+RL8XSMPdWcWy49KITsAfMlyAGUO8Uu3EQE+avi6
	9jTsWVxwKpfo+N46/X2C2KzYE6pZoPc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-0n3lS8PYO36R6rb_3pPABw-1; Mon, 25 Nov 2019 08:30:37 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FE43107B7E0;
	Mon, 25 Nov 2019 13:30:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6B4A5C241;
	Mon, 25 Nov 2019 13:30:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2285018095FF;
	Mon, 25 Nov 2019 13:30:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xANI3ptv022584 for <linux-audit@listman.util.phx.redhat.com>;
	Sat, 23 Nov 2019 13:03:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BB9BC2038B9C; Sat, 23 Nov 2019 18:03:51 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6D632038B80
	for <linux-audit@redhat.com>; Sat, 23 Nov 2019 18:03:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 75CB58CB83E
	for <linux-audit@redhat.com>; Sat, 23 Nov 2019 18:03:49 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-417-H5djzkF2N_GeNp2viPL68g-1; Sat, 23 Nov 2019 13:03:47 -0500
Received: by mail-pg1-f196.google.com with SMTP id k1so5010449pgg.12
	for <linux-audit@redhat.com>; Sat, 23 Nov 2019 10:03:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=b4KazJIdHMahp3tpOcvML7AefY0d0jAOfEKpcKoACHQ=;
	b=WrZw/L20dFQ2E/BqJVUTkvpQht8AkOt0rXshRZYBlt/BHzNMSxooqFuGUFxD4Cmo2c
	cHYBdj/yAmzDovMBmW68bF3MDFhUs8SlXsT1vTW+9rMDqdpdHwJ45OLRWuSdTpTRy9Ly
	zK2xWkJ8Q2gRrEx5X1k9NcbbQ2z3afcq/e8Jr3RFjEWZGD0gw6z9t2t+ErvB4fl1VDPj
	8yMwt3KMceySjhaDBnE2/Pyp+u96EBaui8chj+sY+bPLkoc7KvbmyYaPIRTd2ob/j/kR
	cJUPV4/7y/V5ahd+x0u4OXcjJ4bWoww6qT5JiNaX/huuZHrGuCjGD8MLDJp/s9OuY2dM
	xkqg==
X-Gm-Message-State: APjAAAVuRT3mY4Kb8WjGa1vnt6IkxQt97wh/3fS9ZKUoWB1YDBWkb/Ch
	toi8cmf5D6bw456ZaU1IJ13hy5JXILo=
X-Google-Smtp-Source: APXvYqylczzxoUHlQtIIWwtaPhnuxFWpFB+khkQ+j9Ha3qTgp5tmxdwFACVzBp40ZJK60jhQEGltLA==
X-Received: by 2002:aa7:9787:: with SMTP id o7mr25130589pfp.120.1574532226636; 
	Sat, 23 Nov 2019 10:03:46 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
	[73.202.202.92]) by smtp.gmail.com with ESMTPSA id
	i13sm2305773pfo.39.2019.11.23.10.03.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 23 Nov 2019 10:03:46 -0800 (PST)
Date: Sat, 23 Nov 2019 10:03:40 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Jiri Olsa <jolsa@redhat.com>
Subject: Re: [PATCH] bpf: emit audit messages upon successful prog load and
	unload
Message-ID: <20191123100340.771bfd25@cakuba.netronome.com>
In-Reply-To: <20191123085719.GA1673@krava>
References: <20191120213816.8186-1-jolsa@kernel.org>
	<8c928ec4-9e43-3e2a-7005-21f40fcca061@iogearbox.net>
	<CAADnVQKu-ZgFTaSMH=Q-jMOYYvE32TF2b2hq1=dmDV8wAf18pg@mail.gmail.com>
	<CAHC9VhQbQoXacbTCNJPGNzFOv30PwLeiWu4ROQFU46=saTeTNQ@mail.gmail.com>
	<20191122002257.4hgui6pylpkmpwac@ast-mbp.dhcp.thefacebook.com>
	<CAHC9VhRihMi_d-p+ieXyuVBcGMs80SkypVxF4gLE_s45GKP0dg@mail.gmail.com>
	<20191122192353.GA2157@krava>
	<CAHC9VhRi0JtKgHyAOdAJ=_--vL1VbK7BDq1FnRQ_GwW9P4J_zA@mail.gmail.com>
	<20191123085719.GA1673@krava>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
X-MC-Unique: H5djzkF2N_GeNp2viPL68g-1
X-MC-Unique: 0n3lS8PYO36R6rb_3pPABw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 25 Nov 2019 08:30:17 -0500
Cc: Alexei, Daniel Borkmann <daniel@iogearbox.net>,
	Network Development <netdev@vger.kernel.org>,
	Starovoitov <ast@kernel.org>, Martin KaFai Lau <kafai@fb.com>,
	Jiri Benc <jbenc@redhat.com>, linux-audit@redhat.com,
	Jiri Olsa <jolsa@kernel.org>, David Miller <davem@redhat.com>,
	Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
	Andrii Nakryiko <andriin@fb.com>,
	Alexei Starovoitov <alexei.starovoitov@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 23 Nov 2019 09:57:19 +0100, Jiri Olsa wrote:
> Alexei already asked Dave to revert this in previous email,
> so that should happen

Reverted in net-next now.

But this is not really how this should work. You should post a proper
revert patch to netdev for review, with an explanation in the commit
message etc.

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

