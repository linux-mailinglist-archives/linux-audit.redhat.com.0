Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7161615CD72
	for <lists+linux-audit@lfdr.de>; Thu, 13 Feb 2020 22:45:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581630325;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HfOd3g0zcszmFOSGneIO0ityu7B1QWxzTfZ7IX51hh0=;
	b=bmFWeRV/qSS6tqVonK45vUeckdhg/uRGt/3MPT7VsQX/4fTJpOlMN16smmPqt3IIE8Sb2I
	nqisD1L69ebYWbGfqSvklSXx+LoxWcf0BfAIbqQ5nnwZpgZLhCOIVXuXEvf4B4LkXcDMGj
	ydwK2sQtTVkwqaMqYXoB2mw4JN1k2pw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-PomP2TrUNrKRxJsuAgnTvg-1; Thu, 13 Feb 2020 16:45:23 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84808107ACC5;
	Thu, 13 Feb 2020 21:45:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C58585C1C3;
	Thu, 13 Feb 2020 21:45:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3168581729;
	Thu, 13 Feb 2020 21:45:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01DLilqA005974 for <linux-audit@listman.util.phx.redhat.com>;
	Thu, 13 Feb 2020 16:44:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0DE85BE5A2; Thu, 13 Feb 2020 21:44:47 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 096F1BE5A0
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 21:44:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E3F7B802A53
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 21:44:44 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-403-nx1yhcvNN_uNTfTr92g2ng-1; Thu, 13 Feb 2020 16:44:42 -0500
Received: by mail-ed1-f68.google.com with SMTP id g19so8649396eds.11
	for <linux-audit@redhat.com>; Thu, 13 Feb 2020 13:44:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d6iMkJnmuaDOT/nQ8QyRCzJW1DxHpPU5cNxqRI+5goo=;
	b=NwiMB7pJsoIQkG1ulSLin3pW/b2nTVb7xACvoTDOW4n3KYsyQftLtvAxoXcdYFS4QC
	VApCaVBaP06ZKPqTOeqWWgzGiY8DL5GticUn8JIIA5WZV6aUIxjM2ktEvziBHpLGrfoX
	U3yWbYHQTOHH+QyHJb8qwK7aYSF37Rk8ztdu9Co+PUKyESaU1jeCNpixOic9giWYqmD6
	EB4hdGB6qaT5ltWkSpGqZTLOdGrBKyZ+FqKpc7Khwzs3FQR+Vuzt/XnkKlI1JOLNqXx9
	Dnp2ynEhEzD0ByHQUpj9UjNdA1Br27NBywqETMZjbAz1DqENlgP9gmpQ6JUimfYwK7X2
	lM/Q==
X-Gm-Message-State: APjAAAVQWIbM1RUZfjK0q8NJJL15JYO21KXspd0hvhXnubzEo4zrBEqk
	gtIbzwi1Zi37c9B+HUxSJWnvEb8xve7KvmDsJYBRcGe+NQ==
X-Google-Smtp-Source: APXvYqzivqkXBB8NR1AVMPaykKlw/9vR8JhyBC59wFMjKjm5evBAVa6TlImCpH9hT3l8uI72hnHie5UbgBWCB+RdQRU=
X-Received: by 2002:aa7:db55:: with SMTP id n21mr16664962edt.31.1581630280853; 
	Thu, 13 Feb 2020 13:44:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577736799.git.rgb@redhat.com>
	<20200204231454.oxa7pyvuxbj466fj@madcap2.tricolour.ca>
	<CAHC9VhQquokw+7UOU=G0SsD35UdgmfysVKCGCE87JVaoTkbisg@mail.gmail.com>
	<3142237.YMNxv0uec1@x2>
	<CAHC9VhTiCHQbp2SwK0Xb1QgpUZxOQ26JKKPsVGT0ZvMqx28oPQ@mail.gmail.com>
In-Reply-To: <CAHC9VhTiCHQbp2SwK0Xb1QgpUZxOQ26JKKPsVGT0ZvMqx28oPQ@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 13 Feb 2020 16:44:29 -0500
Message-ID: <CAHC9VhS09b_fM19tn7pHZzxfyxcHnK+PJx80Z9Z1hn8-==4oLA@mail.gmail.com>
Subject: Re: [PATCH ghak90 V8 07/16] audit: add contid support for signalling
	the audit daemon
To: Steve Grubb <sgrubb@redhat.com>
X-MC-Unique: nx1yhcvNN_uNTfTr92g2ng-1
X-MC-Unique: PomP2TrUNrKRxJsuAgnTvg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01DLilqA005974
X-loop: linux-audit@redhat.com
Cc: nhorman@tuxdriver.com, Richard Guy Briggs <rgb@redhat.com>,
	linux-api@vger.kernel.org, containers@lists.linux-foundation.org,
	LKML <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
	linux-audit@redhat.com, netfilter-devel@vger.kernel.org,
	ebiederm@xmission.com, simo@redhat.com, netdev@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	Eric Paris <eparis@parisplace.org>, mpatel@redhat.com,
	Serge Hallyn <serge@hallyn.com>
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a bit of a thread-hijack, and for that I apologize, but
another thought crossed my mind while thinking about this issue
further ... Once we support multiple auditd instances, including the
necessary record routing and duplication/multiple-sends (the host
always sees *everything*), we will likely need to find a way to "trim"
the audit container ID (ACID) lists we send in the records.  The
auditd instance running on the host/initns will always see everything,
so it will want the full container ACID list; however an auditd
instance running inside a container really should only see the ACIDs
of any child containers.

For example, imagine a system where the host has containers 1 and 2,
each running an auditd instance.  Inside container 1 there are
containers A and B.  Inside container 2 there are containers Y and Z.
If an audit event is generated in container Z, I would expect the
host's auditd to see a ACID list of "1,Z" but container 1's auditd
should only see an ACID list of "Z".  The auditd running in container
2 should not see the record at all (that will be relatively
straightforward).  Does that make sense?  Do we have the record
formats properly designed to handle this without too much problem (I'm
not entirely sure we do)?

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

