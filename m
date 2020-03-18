Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 0083C18A6E2
	for <lists+linux-audit@lfdr.de>; Wed, 18 Mar 2020 22:22:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584566573;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=355RvJeSvi4cxRwVflMD9KpClq2GvwYECLJmEg+hQ3A=;
	b=BDKuIMDl/UkBnTIEfoWm1IKgbkbWIj9CKvVzCk9F+VQkeAAp4IUOP5E1bqoyFR+On0vfF/
	wsrPzr8+Poksq8CiDf9h0ChiOaH5VekEWBPcxCb94FhHk/ZWCOgCfLwjdOLL9GS8luAUER
	gUw5kA/oZhIjao5O0S4D3StwLfeOHFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-5ZWwbZGXM6Ck_Mzgv-mjJQ-1; Wed, 18 Mar 2020 17:22:50 -0400
X-MC-Unique: 5ZWwbZGXM6Ck_Mzgv-mjJQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87123800D4E;
	Wed, 18 Mar 2020 21:22:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF8605C1D8;
	Wed, 18 Mar 2020 21:22:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DB62E18089CD;
	Wed, 18 Mar 2020 21:22:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02ILMbuu006696 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 18 Mar 2020 17:22:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E887413AF53; Wed, 18 Mar 2020 21:22:36 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3C0E12F987
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 21:22:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D5C1185A793
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 21:22:32 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-421-QSOFLObjNIq0FEST_FZOAg-1; Wed, 18 Mar 2020 17:22:24 -0400
X-MC-Unique: QSOFLObjNIq0FEST_FZOAg-1
Received: by mail-ed1-f67.google.com with SMTP id z3so15110212edq.11
	for <linux-audit@redhat.com>; Wed, 18 Mar 2020 14:22:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+bCjnLS3/3LmRyiYvzCeE/0vqSGm4G29SOPcHPTj9Nk=;
	b=lk/NC5OsMwv02CxyaVam2L/ffQg2wkJE/5pEdnm/KC8QFEokjapzXIJ+You9+o2e8n
	R1fgGs9oituIfvyHLgPbp5+aGe7q5GlHoVv4xaX0fCc7VN3PXeKKcpo4+4YFnnSnKqC3
	6DdLn3PgG5rnHJpxrDdFGCl+rAzrTreRYjD9OsZsejAkzowjcD7A+u6gSQc1/2k4xFGA
	u45yMaIup24b95vYgb7vJ+WohNgA2kR2jVpzp4VW2kKVEu5Wslgcfky9xthbv9RDJxph
	HiMncLr3fNPbXkAGwGZf08+x6BOF4AFqaL03QIZGPVisYxbmp3+GN3J7OpNTc+RPkdP0
	BmLg==
X-Gm-Message-State: ANhLgQ2ePQiEo6HiPqAe4mICypjjgfJd/MvpWqN7vAQxDB03K71yjSBI
	qbfJF/tWHDKZPxaBLVMQHclzm0yqPyaEkI1P9i3eqBQ=
X-Google-Smtp-Source: ADFU+vvWLUbUOKc99d+nJ2kGsVgRAyeTEiBSorjH6C4MXrjw/aBa+P204vtxxVwDExRc2vW8ycqRFM9YVxibuVJSAck=
X-Received: by 2002:a17:906:7b8d:: with SMTP id
	s13mr198887ejo.77.1584566543231; 
	Wed, 18 Mar 2020 14:22:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584480281.git.rgb@redhat.com>
	<13ef49b2f111723106d71c1bdeedae09d9b300d8.1584480281.git.rgb@redhat.com>
	<20200318131128.axyddgotzck7cit2@madcap2.tricolour.ca>
In-Reply-To: <20200318131128.axyddgotzck7cit2@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 18 Mar 2020 17:22:12 -0400
Message-ID: <CAHC9VhTdLZop0eT11H4uSXRj5M=kBet=GkA8taDwGN_BVMyhrQ@mail.gmail.com>
Subject: Re: [PATCH ghak25 v3 3/3] audit: add subj creds to NETFILTER_CFG
	record to cover async unregister
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02ILMbuu006696
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 18, 2020 at 9:12 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-03-17 17:30, Richard Guy Briggs wrote:
> > Some table unregister actions seem to be initiated by the kernel to
> > garbage collect unused tables that are not initiated by any userspace
> > actions.  It was found to be necessary to add the subject credentials to
> > cover this case to reveal the source of these actions.  A sample record:
> >
> >   type=NETFILTER_CFG msg=audit(2020-03-11 21:25:21.491:269) : table=nat family=bridge entries=0 op=unregister pid=153 uid=root auid=unset tty=(none) ses=unset subj=system_u:system_r:kernel_t:s0 comm=kworker/u4:2 exe=(null)
>
> Given the precedent set by bpf unload, I'd really rather drop this patch
> that adds subject credentials.
>
> Similarly with ghak25's subject credentials, but they were already
> present and that would change an existing record format, so it isn't
> quite as justifiable in that case.

Your comments have me confused - do you want this patch (v3 3/3)
considered for merging or no?

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

