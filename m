Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 37F6D1DBD12
	for <lists+linux-audit@lfdr.de>; Wed, 20 May 2020 20:41:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590000088;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=14jGV0HDRtSMc3TUmGFYRGWxJ/tTds8sWrCAKijHpE4=;
	b=U9QdIiErx+NNAUoTc4WqFsWz+DAbOJ3sGAc5isQIoxJzpaT2fjR4Y3R6Vl4yLwow2Z6Hmo
	65t7dgL1i3nBihAXus0VuF9CNMt3EDpZL/I5oMdJVBs9r6y5youvpt3rufnd38vvHyL3NW
	l5k5ZMxEq3lKdGmWeuXLk9Nb1sPv7JI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-J15vZgvVPl6bpJNC663bXQ-1; Wed, 20 May 2020 14:41:25 -0400
X-MC-Unique: J15vZgvVPl6bpJNC663bXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E290474;
	Wed, 20 May 2020 18:41:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D50D5D9CA;
	Wed, 20 May 2020 18:41:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 57B551809543;
	Wed, 20 May 2020 18:41:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KIf315024719 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 14:41:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7AADB10D16AE; Wed, 20 May 2020 18:41:03 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76E4610D16B9
	for <linux-audit@redhat.com>; Wed, 20 May 2020 18:41:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D1E28316FA
	for <linux-audit@redhat.com>; Wed, 20 May 2020 18:41:00 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
	[209.85.218.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-225-kvwofrUUOK2HNwdwNTgjkA-1; Wed, 20 May 2020 14:40:58 -0400
X-MC-Unique: kvwofrUUOK2HNwdwNTgjkA-1
Received: by mail-ej1-f65.google.com with SMTP id l21so5339198eji.4
	for <linux-audit@redhat.com>; Wed, 20 May 2020 11:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gu04BwxFLehQzkmABOcTDiBulPEzSlONSfMwZQcVMtk=;
	b=QB7CvQJJ3jyBlIK+mQfUQbxH2vp0vRjuHrvj2cvmKFj6H2uw4ZMbVZ9lNIf5dOVKPq
	5QWnx98OuS863FwwziRqmOUhw8OnG8l2c7t8MCHOivoJJhUCn7vtISUCdlzjKuzTjrdc
	Y3lKeKrj/Sae245CjgC9PX0fQFFBz/mZUFpiESmhrd+ZKaKtdSWpI3ju8mMKdD0D2/fE
	reAWyxMvMgrH1ieb0/E71mXZRzSx8sLs+FUUhu2i+c2BVrz+4y0e+cy24hKoHVIudZ+C
	LbJdE0bcxYcL9OuLYcf9Jjq6o6POY8lH5YuVnCilF2IlwVrevwGCqE8iGEd0/fmR8ZqN
	eRSg==
X-Gm-Message-State: AOAM531HUYGa8CMRRYTaSWQFYLJiEPqIZmfb4lujizY7DURpSoe6wIrT
	KMXsnPbdyiiwULVGNBzEXDKkT4YpdwuSeuQyybJD
X-Google-Smtp-Source: ABdhPJyl432j3d/8pUxUMZAk69CZRW+QGZ+OUXPSZa5FOTEpEa51O5OI2Wnf9L8vbda23KiNDb/yNHyV/QJBl7Ez13k=
X-Received: by 2002:a17:906:4d82:: with SMTP id
	s2mr387133eju.542.1590000056930; 
	Wed, 20 May 2020 11:40:56 -0700 (PDT)
MIME-Version: 1.0
References: <a585b9933896bc542347d8f3f26b08005344dd84.1589920939.git.rgb@redhat.com>
	<20200520165510.4l4q47vq6fyx7hh6@madcap2.tricolour.ca>
In-Reply-To: <20200520165510.4l4q47vq6fyx7hh6@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 20 May 2020 14:40:45 -0400
Message-ID: <CAHC9VhRERV9_kgpcn2LBptgXGY0BB4A9CHT+V4-HFMcNd9_Ncg@mail.gmail.com>
Subject: Re: [PATCH ghak25 v6] audit: add subj creds to NETFILTER_CFG record
	to cover async unregister
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-audit@redhat.com
Cc: fw@strlen.de, LKML <linux-kernel@vger.kernel.org>,
	Linux-Audit Mailing List <linux-audit@redhat.com>,
	netfilter-devel@vger.kernel.org, twoerner@redhat.com,
	Eric Paris <eparis@parisplace.org>, tgraf@infradead.org
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 20, 2020 at 12:55 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-05-20 12:51, Richard Guy Briggs wrote:
> > Some table unregister actions seem to be initiated by the kernel to
> > garbage collect unused tables that are not initiated by any userspace
> > actions.  It was found to be necessary to add the subject credentials to
> > cover this case to reveal the source of these actions.  A sample record:
> >
> > The uid, auid, tty, ses and exe fields have not been included since they
> > are in the SYSCALL record and contain nothing useful in the non-user
> > context.
> >
> >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2

FWIW, that record looks good.

> > Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
>
> Self-NACK.  I forgot to remove cred and tty declarations.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

