Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A48011AACF0
	for <lists+linux-audit@lfdr.de>; Wed, 15 Apr 2020 18:07:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586966851;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UbRdoRg4V2WnKoYaOo8hB00+ruFFYJ9CjAfMEyV6MhA=;
	b=V7og3GyxF2rmPvh+GhTR/ZvL+MN1BODvg22Ekyi7BE70OOnWAniIxpqWOlGFVzgkabZLLC
	fQ1zGE6EkODN/LATFY0x+jGGaDR7MfDN3qlDLSzoycSPYYLsITiUwlkjKUaselkYaHtFCf
	t7wq2W1h1IQ6O4uZCm5tG/cH6ZqjmXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-2pmqNH1kNcyiH6ZBwA-__w-1; Wed, 15 Apr 2020 12:07:29 -0400
X-MC-Unique: 2pmqNH1kNcyiH6ZBwA-__w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 435838010F0;
	Wed, 15 Apr 2020 16:07:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79A4F60BEC;
	Wed, 15 Apr 2020 16:07:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 632CE93363;
	Wed, 15 Apr 2020 16:07:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03FG7DX3013188 for <linux-audit@listman.util.phx.redhat.com>;
	Wed, 15 Apr 2020 12:07:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D203AF9AB2; Wed, 15 Apr 2020 16:07:13 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE0DB10F9AD
	for <linux-audit@redhat.com>; Wed, 15 Apr 2020 16:07:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA3688FF67A
	for <linux-audit@redhat.com>; Wed, 15 Apr 2020 16:07:10 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-309-UqZHnazcNB6mZuosqZsrmg-1; Wed, 15 Apr 2020 12:07:07 -0400
X-MC-Unique: UqZHnazcNB6mZuosqZsrmg-1
Received: by mail-ed1-f67.google.com with SMTP id e5so5601109edq.5
	for <linux-audit@redhat.com>; Wed, 15 Apr 2020 09:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0MLjDM9KsRvMVgG43FusnRuA/V1fF1PP6aJDpeifgKM=;
	b=UkOpD7Q7ZZYPr++05odK4/zwt/iV1iyEL9X0B04EGHV3RXavlLW4He6Lr52qOSo00I
	2+thSXt4fal/uHGLCUmgy2tkP3pW3QWoQ60hLGHQfsJWFVLh23sUqBpWhLY3Io/NF7g7
	nBK0TU3nTqvcQ59K3na65iGkU/BX/S4mIma9nAcrgz1IlDhpAkSRCyxIP77Db0G6x0+N
	cyvwFvrqzYs9YQOj1whavAKofBjZfPTJiHcUD+bEPNXXDVeUJODK8+lfj0X4mMN33e4d
	AF7ENcEtjBVAlTvHY4y9rXT4gS7AxOXsaPF3JDvDH9DQJhLP4Hmp025oFcuMzfR9G53z
	yY8A==
X-Gm-Message-State: AGi0PuanlGGkO7lleEfYQMoL44dIs+N2a8iIuuiTpQX0odRpcgz4pHOy
	UQUknXxTQZMPKUeAKccW8tZGboQ9NwcuCRWWQzJrbEAawQ==
X-Google-Smtp-Source: APiQypLP8COjvsdYHv4oXFXwMf6J6TP99ygaMw9PYLf1PRivCLwn52/dEdrcmQ4/gmtocLU0XDdyhTYcQV/snRujxWw=
X-Received: by 2002:a05:6402:1d1c:: with SMTP id
	dg28mr23779746edb.135.1586966826498; 
	Wed, 15 Apr 2020 09:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20191128153203.GA23803@workstation-kernel-dev>
	<20191130020742.GF157739@google.com>
	<20200415153417.svpbimg66vbeuk7u@madcap2.tricolour.ca>
In-Reply-To: <20200415153417.svpbimg66vbeuk7u@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 15 Apr 2020 12:06:55 -0400
Message-ID: <CAHC9VhTdfkxdiEwCZu-JCQGxJ_DNr0b_Ukm40VEUxq=Lc-zx1g@mail.gmail.com>
Subject: Re: [PATCH v2] kernel: audit.c: Add __rcu notation to RCU pointer
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03FG7DX3013188
X-loop: linux-audit@redhat.com
Cc: Amol Grover <frextrite@gmail.com>, linux-kernel@vger.kernel.org,
	linux-audit@redhat.com, Shuah Khan <skhan@linuxfoundation.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	linux-kernel-mentees@lists.linuxfoundation.org
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

On Wed, Apr 15, 2020 at 11:34 AM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2019-11-29 21:07, Joel Fernandes wrote:
> > On Thu, Nov 28, 2019 at 09:02:03PM +0530, Amol Grover wrote:
> > > add __rcu notation to RCU protected global pointer auditd_conn
> >
> > Again, please use proper punctuation and captilization. This is unacceptable.
> > Please put more effort into changelog.
> >
> > Otherwise the patch diff itself looks good to me, with the above nit
> > corrected, you could add my tag to the next revision:
> >
> > Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> >
> > thanks,
> >
> >  - Joel
> >
> > >
> > > Fixes multiple instances of sparse error:
> > > error: incompatible types in comparison expression
> > > (different address spaces)
>
> Amol or Joel: Is there a reproducer recipe for this?

The commit which was merged has a slightly better description which may help.

  commit cb5172d96d16df72db8b55146b0ec00bfd97f079
  Author: Amol Grover <frextrite@gmail.com>
  Date:   Mon Dec 2 00:03:48 2019 +0530

   audit: Add __rcu annotation to RCU pointer

   Add __rcu annotation to RCU-protected global pointer auditd_conn.

   auditd_conn is an RCU-protected global pointer,i.e., accessed
   via RCU methods rcu_dereference() and rcu_assign_pointer(),
   hence it must be annotated with __rcu for sparse to report
   warnings/errors correctly.

   Fix multiple instances of the sparse error:
   error: incompatible types in comparison expression
   (different address spaces)

   Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
   Signed-off-by: Amol Grover <frextrite@gmail.com>
   [PM: tweak subject line]
   Signed-off-by: Paul Moore <paul@paul-moore.com>

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

