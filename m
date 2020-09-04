Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B936025E26B
	for <lists+linux-audit@lfdr.de>; Fri,  4 Sep 2020 22:09:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-RJnGCOe5OvyyxspJy87P4A-1; Fri, 04 Sep 2020 16:09:53 -0400
X-MC-Unique: RJnGCOe5OvyyxspJy87P4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35CDD802B4B;
	Fri,  4 Sep 2020 20:09:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4D0511002D5A;
	Fri,  4 Sep 2020 20:09:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C21A279A28;
	Fri,  4 Sep 2020 20:09:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 084K92oU015404 for <linux-audit@listman.util.phx.redhat.com>;
	Fri, 4 Sep 2020 16:09:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD512103CA3; Fri,  4 Sep 2020 20:09:02 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8E8110FF22
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 20:09:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E02F182D525
	for <linux-audit@redhat.com>; Fri,  4 Sep 2020 20:09:00 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
	[209.85.218.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-484-VxTmawTNNbm3TkcIDdqhng-1; Fri, 04 Sep 2020 16:08:57 -0400
X-MC-Unique: VxTmawTNNbm3TkcIDdqhng-1
Received: by mail-ej1-f67.google.com with SMTP id j11so10239673ejk.0
	for <linux-audit@redhat.com>; Fri, 04 Sep 2020 13:08:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E1NHBybIhhCgKygMIm+6vgzAeFtMl/WTsqdcpjKpwac=;
	b=jCmvwjDmkOzJAcn1rmxWtGd1EQSesJhOspOR3omycvUqPZfSrll7vQ6Rv0smQ0nXuR
	R5D05wJHKkUc8Ygwhz38b4koI8Dr/x88gLNZY/CSbYxyrXT3Es5YNOeQTSSEGtTPRkf/
	0v2p0GwYa1YWX635wR+on9WaSGCFqkrpRtRSSP5a1xh8hpxdVwZvqL+yv8+YgYXP+ehO
	9LOKIiX2tF2YRCIM6o3Ri3n6LtZSJV1AYj7Tsohcxl2W4kDFq/7MVa2fKnKbFyQTD57x
	IBOWzXhKrQo+GvA+3hrcFWHXoMpRsYbT1dZtEnPitJ2PpQc7pAKYPUcegTYZ6AcJLWyF
	2tyg==
X-Gm-Message-State: AOAM533PIK3UWzKWJO2YVC84ME0e0MSrIJhCo4gJ7nnsiQqJLVxcZEwb
	8JnRbcILxL33HioyF5CxHNLoBcCfW9O6ATYGKy1W
X-Google-Smtp-Source: ABdhPJw8DsKmpE1p7scVjs9No/PHLwUznrGrFAiZkVjDZcbKE9M8l7G/4K28wUYYMuWLjg3q2rzP8DFmhYc164iH/CU=
X-Received: by 2002:a17:906:43c9:: with SMTP id
	j9mr9192671ejn.542.1599250136524; 
	Fri, 04 Sep 2020 13:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200826145247.10029-1-casey@schaufler-ca.com>
	<20200826145247.10029-6-casey@schaufler-ca.com>
In-Reply-To: <20200826145247.10029-6-casey@schaufler-ca.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 4 Sep 2020 16:08:45 -0400
Message-ID: <CAHC9VhSh=r4w_3mZOUwmKN0UxCMxPNGKd=_vr_iGV06rvCNbSA@mail.gmail.com>
Subject: Re: [PATCH v20 05/23] net: Prepare UDS for security module stacking
To: Casey Schaufler <casey@schaufler-ca.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-audit@redhat.com
Cc: john.johansen@canonical.com, selinux@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	linux-security-module@vger.kernel.org, linux-audit@redhat.com,
	casey.schaufler@intel.com, Stephen Smalley <sds@tycho.nsa.gov>
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 26, 2020 at 11:07 AM Casey Schaufler <casey@schaufler-ca.com> wrote:
>
> Change the data used in UDS SO_PEERSEC processing from a
> secid to a more general struct lsmblob. Update the
> security_socket_getpeersec_dgram() interface to use the
> lsmblob. There is a small amount of scaffolding code
> that will come out when the security_secid_to_secctx()
> code is brought in line with the lsmblob.
>
> Signed-off-by: Casey Schaufler <casey@schaufler-ca.com>
> ---
>  include/linux/security.h |  7 +++++--
>  include/net/af_unix.h    |  2 +-
>  include/net/scm.h        |  8 +++++---
>  net/ipv4/ip_sockglue.c   |  8 +++++---
>  net/unix/af_unix.c       |  6 +++---
>  security/security.c      | 18 +++++++++++++++---
>  6 files changed, 34 insertions(+), 15 deletions(-)

...

> diff --git a/include/net/af_unix.h b/include/net/af_unix.h
> index f42fdddecd41..a86da0cb5ec1 100644
> --- a/include/net/af_unix.h
> +++ b/include/net/af_unix.h
> @@ -36,7 +36,7 @@ struct unix_skb_parms {
>         kgid_t                  gid;
>         struct scm_fp_list      *fp;            /* Passed files         */
>  #ifdef CONFIG_SECURITY_NETWORK
> -       u32                     secid;          /* Security ID          */
> +       struct lsmblob          lsmblob;        /* Security LSM data    */

As mentioned in a previous revision, I remain concerned that this is
going to become a problem due to the size limit on unix_skb_parms.  I
would need to redo the math to be certain, but if I recall correctly
this would limit us to five LSMs assuming both that we don't need to
grow the per-LSM size of lsmblob *and* the netdev folks don't decide
to add more fields to the unix_skb_parms.

I lost track of that earlier discussion so I'm not sure where it ended
up, but if there is a viable alternative it might be a good idea to
pursue it.

-- 
paul moore
www.paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

