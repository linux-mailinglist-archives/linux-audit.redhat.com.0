Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8671A20E946
	for <lists+linux-audit@lfdr.de>; Tue, 30 Jun 2020 01:24:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-7HzzICqDOTujebdfQVNwkg-1; Mon, 29 Jun 2020 19:24:25 -0400
X-MC-Unique: 7HzzICqDOTujebdfQVNwkg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 924641902EA1;
	Mon, 29 Jun 2020 23:24:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 253CB60BEC;
	Mon, 29 Jun 2020 23:24:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60EF287897;
	Mon, 29 Jun 2020 23:24:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TNO1Zr017216 for <linux-audit@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 19:24:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 093E52157F25; Mon, 29 Jun 2020 23:24:01 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 052902166BA3
	for <linux-audit@redhat.com>; Mon, 29 Jun 2020 23:23:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 09EE5924901
	for <linux-audit@redhat.com>; Mon, 29 Jun 2020 23:23:59 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-318-_zG-KxgGMu-O0SQkXWU5mQ-1; Mon, 29 Jun 2020 19:23:56 -0400
X-MC-Unique: _zG-KxgGMu-O0SQkXWU5mQ-1
Received: by mail-ed1-f65.google.com with SMTP id g20so14264899edm.4
	for <linux-audit@redhat.com>; Mon, 29 Jun 2020 16:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sHKzrk/z/kMGPeyIpM+M4V0Dj+/IWbE197hNLvsYk+s=;
	b=cH5rZM48Np/Jwv7v5wJOnE/2sbjOYZgdBGZQkyrpo1POzugkvkYqnCUNvA22o/TC8X
	F7/wkdaDIZG+ytsbpKxH7CCO81d96AuDah0nkqSUVTqk7T0/3lMrJI92D4I/Hqb4PmKH
	OxSbPyA4zMbwgxczDMTwttHTE8XTi9fExNMlxxZneD8F7jTzoVR0Ii60bOYNW19pRtSV
	POJrd4CrZA9iZOzzLXsTIBCo1zYPnEEH5ijPUVAGLZtSha+2Qi+yp6d/AIo/eTFxdFl8
	zkwHAou5zk5dLQf7+VZVVd6mx/bTncTpLqGIIGOb1h8ckug+Q91MNA8Fzqqo8xZpTViU
	tdKQ==
X-Gm-Message-State: AOAM532NEgdeoyGLopTAFocm9jSvUhHI12W6IzcEM2DwXkPV46qev5bp
	As33+SunbNcsbvymBgHJkk//sNKzZVKpHB8P/F+v
X-Google-Smtp-Source: ABdhPJxyA+6RjLsB9FF9dnCzR+IB1u8N4C+wjXzo4Gq6/z6kzwoYhfqAoDIm8F+VuXxiiZdIu2uJmXU5hbA7P0ACG4A=
X-Received: by 2002:aa7:d6cf:: with SMTP id x15mr19695792edr.164.1593473035100;
	Mon, 29 Jun 2020 16:23:55 -0700 (PDT)
MIME-Version: 1.0
References: <3eda864fb69977252a061c8c3ccd2d8fcd1f3a9b.1593278952.git.rgb@redhat.com>
In-Reply-To: <3eda864fb69977252a061c8c3ccd2d8fcd1f3a9b.1593278952.git.rgb@redhat.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 29 Jun 2020 19:23:44 -0400
Message-ID: <CAHC9VhR3qiFeWnC8=jJro8d=qEco7+uReR=RNFzTkQm7vd9zFw@mail.gmail.com>
Subject: Re: [PATCH ghak124 v3fix] audit: add gfp parameter to audit_log_nfcfg
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org,
	dan.carpenter@oracle.com
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

On Sat, Jun 27, 2020 at 11:25 PM Richard Guy Briggs <rgb@redhat.com> wrote:
>
> Fixed an inconsistent use of GFP flags in nft_obj_notify() that used
> GFP_KERNEL when a GFP flag was passed in to that function.  Given this
> allocated memory was then used in audit_log_nfcfg() it led to an audit
> of all other GFP allocations in net/netfilter/nf_tables_api.c and a
> modification of audit_log_nfcfg() to accept a GFP parameter.
>
> Reported-by: Dan Carptenter <dan.carpenter@oracle.com>
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> ---
> Passes audit-testsuite.
>
>  include/linux/audit.h           |  8 ++++----
>  kernel/auditsc.c                |  4 ++--
>  net/bridge/netfilter/ebtables.c |  6 +++---
>  net/netfilter/nf_tables_api.c   | 33 +++++++++++++++++++++------------
>  net/netfilter/x_tables.c        |  5 +++--
>  5 files changed, 33 insertions(+), 23 deletions(-)

Merged into audit/next.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

