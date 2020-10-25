Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B41F4298E6A
	for <lists+linux-audit@lfdr.de>; Mon, 26 Oct 2020 14:48:01 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-g4MYVg1eNqqvNY0iSQQIkQ-1; Mon, 26 Oct 2020 09:47:58 -0400
X-MC-Unique: g4MYVg1eNqqvNY0iSQQIkQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C25B1084D73;
	Mon, 26 Oct 2020 13:47:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40EE810013C4;
	Mon, 26 Oct 2020 13:47:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 16847181A06B;
	Mon, 26 Oct 2020 13:47:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09PMlVDa025500 for <linux-audit@listman.util.phx.redhat.com>;
	Sun, 25 Oct 2020 18:47:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21D65200A7CD; Sun, 25 Oct 2020 22:47:31 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D2EB20110C8
	for <linux-audit@redhat.com>; Sun, 25 Oct 2020 22:47:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA3F2858287
	for <linux-audit@redhat.com>; Sun, 25 Oct 2020 22:47:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-546-zLLxmrvyP9SlVxkPuYn5fg-1;
	Sun, 25 Oct 2020 18:47:24 -0400
X-MC-Unique: zLLxmrvyP9SlVxkPuYn5fg-1
Received: from coco.lan (ip5f5ad5d5.dynamic.kabel-deutschland.de
	[95.90.213.213])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 9A6FE2225E;
	Sun, 25 Oct 2020 22:38:25 +0000 (UTC)
Date: Sun, 25 Oct 2020 23:38:20 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH v3 51/56] audit: fix a kernel-doc markup
Message-ID: <20201025233820.7f946e1c@coco.lan>
In-Reply-To: <CAHC9VhQ88cuU-0QdpYJyJZE3FU-3graP=N9n9eiG4Kj2tDbiBQ@mail.gmail.com>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
	<8c04d5c5d0144019c2c38d7c3f31061d6b35d360.1603469755.git.mchehab+huawei@kernel.org>
	<CAHC9VhQ88cuU-0QdpYJyJZE3FU-3graP=N9n9eiG4Kj2tDbiBQ@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-audit@redhat.com
X-Mailman-Approved-At: Mon, 26 Oct 2020 09:37:48 -0400
Cc: linux-audit@redhat.com, Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
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

Em Sun, 25 Oct 2020 18:10:44 -0400
Paul Moore <paul@paul-moore.com> escreveu:

> On Fri, Oct 23, 2020 at 12:33 PM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > typo:
> >         kauditd_print_skb -> kauditd_printk_skb
> >
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  kernel/audit.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)  
> 
> Looks good to me, nice catch.  Would you like me to pull this into the
> audit tree or are you intending this to get pulled in as part of the
> larger patchset somewhere else?

Feel free to apply it directly via audit tree.

> 
> Acked-by: Paul Moore <paul@paul-moore.com>

Thanks!
Mauro

> 
> > diff --git a/kernel/audit.c b/kernel/audit.c
> > index 68cee3bc8cfe..0be42cac086b 100644
> > --- a/kernel/audit.c
> > +++ b/kernel/audit.c
> > @@ -523,7 +523,7 @@ static int auditd_set(struct pid *pid, u32 portid, struct net *net)
> >  }
> >
> >  /**
> > - * kauditd_print_skb - Print the audit record to the ring buffer
> > + * kauditd_printk_skb - Print the audit record to the ring buffer
> >   * @skb: audit record
> >   *
> >   * Whatever the reason, this packet may not make it to the auditd connection
> > --
> > 2.26.2  
> 



Thanks,
Mauro

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

