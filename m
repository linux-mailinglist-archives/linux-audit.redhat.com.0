Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B270C1DC24D
	for <lists+linux-audit@lfdr.de>; Thu, 21 May 2020 00:45:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590014706;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FUfvUfrjY1Td3eLJsqvHlwW2dK1gglsq9F7mOz8DcGY=;
	b=EsZX/SpKtQSvSPMvCN/ojyEaps4Vhd+gr167/KsldIN5MJFfW74YGF8cAYAopJlebihBBU
	zetW6sK+7VUcvDEoQ+0hog95Qb5KnJskJpBLHa0OOIo3yZTh7H6DX+py8FzYBgwOPtycoM
	b9M5ecVxAuZ9SD7MeyzwtLTw32IHzAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-EyvVh_6rPiy3d325hPzUqw-1; Wed, 20 May 2020 18:45:04 -0400
X-MC-Unique: EyvVh_6rPiy3d325hPzUqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C01E107ACCA;
	Wed, 20 May 2020 22:44:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C3CB106F76B;
	Wed, 20 May 2020 22:44:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D45094EDB8;
	Wed, 20 May 2020 22:44:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KMh4l3008309 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 18:43:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6907482E7C; Wed, 20 May 2020 22:43:04 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from madcap2.tricolour.ca (unknown [10.10.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65CF8707C0;
	Wed, 20 May 2020 22:42:57 +0000 (UTC)
Date: Wed, 20 May 2020 18:42:54 -0400
From: Richard Guy Briggs <rgb@redhat.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH ghak25 v6a] audit: add subj creds to NETFILTER_CFG record
	to cover async unregister
Message-ID: <20200520224253.gb4fwelmxqexlif3@madcap2.tricolour.ca>
References: <6404938413ca29b0e0196dd74bacb9b0c1cb6f42.1589993784.git.rgb@redhat.com>
	<CAHC9VhT9MBseD87hOq-9FN7-fdKEPn5bcvUYiX3S3Nu4EJwiig@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhT9MBseD87hOq-9FN7-fdKEPn5bcvUYiX3S3Nu4EJwiig@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-audit@redhat.com
Cc: Linux-Audit Mailing List <linux-audit@redhat.com>
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 2020-05-20 18:24, Paul Moore wrote:
> On Wed, May 20, 2020 at 2:47 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> >
> > Some table unregister actions seem to be initiated by the kernel to
> > garbage collect unused tables that are not initiated by any userspace
> > actions.  It was found to be necessary to add the subject credentials to
> > cover this case to reveal the source of these actions.  A sample record:
> >
> > The uid, auid, tty, ses and exe fields have not been included since they
> > are in the SYSCALL record and contain nothing useful in the non-user
> > context.
> >
> > Here are two sample orphaned records:
> >
> >   type=NETFILTER_CFG msg=audit(2020-05-20 12:14:36.505:5) : table=filter family=ipv4 entries=0 op=register pid=1 subj=kernel comm=swapper/0
> >
> >   type=NETFILTER_CFG msg=audit(2020-05-20 12:15:27.701:301) : table=nat family=bridge entries=0 op=unregister pid=30 subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:1
> >
> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> 
> Merged into audit/next, thanks Richard.

Thanks, Paul.

> paul moore

- RGB

--
Richard Guy Briggs <rgb@redhat.com>
Sr. S/W Engineer, Kernel Security, Base Operating Systems
Remote, Ottawa, Red Hat Canada
IRC: rgb, SunRaycer
Voice: +1.647.777.2635, Internal: (81) 32635

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

