Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 657046DCBA9
	for <lists+linux-audit@lfdr.de>; Mon, 10 Apr 2023 21:37:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681155426;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Cwi9Oy1dTqJJ6wKgyZ6e49ZtarFeFGnoadcqgVAbqA0=;
	b=e3bc7kEf/t84/a+B7yTBunaI3GUJWE3qBu/yTLKKyYZSQ/tsN3DkVKqtTP8Elr1mv89yD7
	MkI3cLbcW2eDDQ7mEE5ti3SlqXuvp0ySBAuP6IDdPhcw276h10eQd74bgxfLNmNIQhU7wu
	I5V9rFaaGWXR3MZMnKATy5hpHSQ86M0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-scFLoPPFMIeMXQRQHTlR9g-1; Mon, 10 Apr 2023 15:37:04 -0400
X-MC-Unique: scFLoPPFMIeMXQRQHTlR9g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F46F185A78F;
	Mon, 10 Apr 2023 19:37:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B19C5492B00;
	Mon, 10 Apr 2023 19:36:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5DBDD1946A49;
	Mon, 10 Apr 2023 19:36:53 +0000 (UTC)
X-Original-To: linux-audit@listman.corp.redhat.com
Delivered-To: linux-audit@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A6F6C1946586 for <linux-audit@listman.corp.redhat.com>;
 Mon, 10 Apr 2023 19:10:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 44EBF440BC; Mon, 10 Apr 2023 19:10:40 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CFC444002
 for <linux-audit@redhat.com>; Mon, 10 Apr 2023 19:10:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D2B5858F09
 for <linux-audit@redhat.com>; Mon, 10 Apr 2023 19:10:40 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
 relay.mimecast.com with ESMTP id us-mta-483-FGOX4iX4MlqpdNjg5P5oZQ-1; Mon,
 10 Apr 2023 15:10:36 -0400
X-MC-Unique: FGOX4iX4MlqpdNjg5P5oZQ-1
Received: by linux.microsoft.com (Postfix, from userid 1052)
 id 36F172174E2A; Mon, 10 Apr 2023 12:10:35 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 36F172174E2A
Date: Mon, 10 Apr 2023 12:10:35 -0700
From: Fan Wu <wufan@linux.microsoft.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [RFC PATCH v9 05/16] ipe: add userspace interface
Message-ID: <20230410191035.GB18827@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1675119451-23180-1-git-send-email-wufan@linux.microsoft.com>
 <1675119451-23180-6-git-send-email-wufan@linux.microsoft.com>
 <CAHC9VhRa+NwKzLfQBmHfMgUp6_d5soQG7JBq-Vn=MUeUAt4tuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHC9VhRa+NwKzLfQBmHfMgUp6_d5soQG7JBq-Vn=MUeUAt4tuQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Mon, 10 Apr 2023 19:36:51 +0000
X-BeenThere: linux-audit@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Audit Discussion <linux-audit.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-audit/>
List-Post: <mailto:linux-audit@redhat.com>
List-Help: <mailto:linux-audit-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-audit>,
 <mailto:linux-audit-request@redhat.com?subject=subscribe>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, tytso@mit.edu,
 dm-devel@redhat.com, corbet@lwn.net, roberto.sassu@huawei.com,
 Deven Bowers <deven.desai@linux.microsoft.com>, linux-doc@vger.kernel.org,
 snitzer@kernel.org, jmorris@namei.org, zohar@linux.ibm.com,
 linux-kernel@vger.kernel.org, ebiggers@kernel.org,
 linux-security-module@vger.kernel.org, linux-audit@redhat.com,
 eparis@redhat.com, linux-fscrypt@vger.kernel.org,
 linux-integrity@vger.kernel.org, agk@redhat.com, serge@hallyn.com
Errors-To: linux-audit-bounces@redhat.com
Sender: "Linux-audit" <linux-audit-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.microsoft.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Mar 02, 2023 at 02:04:42PM -0500, Paul Moore wrote:
> On Mon, Jan 30, 2023 at 5:58???PM Fan Wu <wufan@linux.microsoft.com> wrote:
> >
> > From: Deven Bowers <deven.desai@linux.microsoft.com>
> >
> > As is typical with LSMs, IPE uses securityfs as its interface with
> > userspace. for a complete list of the interfaces and the respective
> > inputs/outputs, please see the documentation under
> > admin-guide/LSM/ipe.rst
> >
> > Signed-off-by: Deven Bowers <deven.desai@linux.microsoft.com>
> > Signed-off-by: Fan Wu <wufan@linux.microsoft.com>
> 
> ...
> 
> > ---
> >  security/ipe/Makefile    |   2 +
> >  security/ipe/fs.c        | 101 +++++++++
> >  security/ipe/fs.h        |  17 ++
> >  security/ipe/ipe.c       |   3 +
> >  security/ipe/ipe.h       |   2 +
> >  security/ipe/policy.c    | 135 ++++++++++++
> >  security/ipe/policy.h    |   7 +
> >  security/ipe/policy_fs.c | 459 +++++++++++++++++++++++++++++++++++++++
> >  8 files changed, 726 insertions(+)
> >  create mode 100644 security/ipe/fs.c
> >  create mode 100644 security/ipe/fs.h
> >  create mode 100644 security/ipe/policy_fs.c
> 
> ...
> 
> > diff --git a/security/ipe/policy.c b/security/ipe/policy.c
> > index 772d876b1087..a5e9c6e5691b 100644
> > --- a/security/ipe/policy.c
> > +++ b/security/ipe/policy.c
> > @@ -4,12 +4,39 @@
> >   */
> >
> >  #include "ipe.h"
> > +#include "eval.h"
> > +#include "fs.h"
> >  #include "policy.h"
> >  #include "policy_parser.h"
> >  #include "digest.h"
> >
> >  #include <linux/verification.h>
> >
> > +/* lock for synchronizing writers across ipe policy */
> > +DEFINE_SPINLOCK(ipe_policy_lock);
> > +
> > +/**
> > + * ver_to_u64 - Convert an internal ipe_policy_version to a u64.
> > + * @p: Policy to extract the version from.
> > + *
> > + * Bits (LSB is index 0):
> > + *     [48,32] -> Major
> > + *     [32,16] -> Minor
> > + *     [16, 0] -> Revision
> > + *
> > + * Return: u64 version of the embedded version structure.
> > + */
> > +static inline u64 ver_to_u64(const struct ipe_policy *const p)
> > +{
> > +       u64 r = 0;
> 
> No need to set @r to 0 since you set it to the version immediately below.
> 

Yes this is redundant, I will remove it.

> > +       r = (((u64)p->parsed->version.major) << 32)
> > +         | (((u64)p->parsed->version.minor) << 16)
> > +         | ((u64)(p->parsed->version.rev));
> > +
> > +       return r;
> > +}
> > +
> >  /**
> >   * ipe_free_policy - Deallocate a given IPE policy.
> >   * @p: Supplies the policy to free.
> > @@ -21,6 +48,7 @@ void ipe_free_policy(struct ipe_policy *p)
> >         if (IS_ERR_OR_NULL(p))
> >                 return;
> >
> > +       ipe_del_policyfs_node(p);
> >         free_parsed_policy(p->parsed);
> >         if (!p->pkcs7)
> >                 kfree(p->text);
> > @@ -39,6 +67,70 @@ static int set_pkcs7_data(void *ctx, const void *data, size_t len,
> >         return 0;
> >  }
> >
> > +/**
> > + * ipe_update_policy - parse a new policy and replace @old with it.
> > + * @addr: Supplies a pointer to the i_private for saving policy.
> > + * @text: Supplies a pointer to the plain text policy.
> > + * @textlen: Supplies the length of @text.
> > + * @pkcs7: Supplies a pointer to a buffer containing a pkcs7 message.
> > + * @pkcs7len: Supplies the length of @pkcs7len.
> > + *
> > + * @text/@textlen is mutually exclusive with @pkcs7/@pkcs7len - see
> > + * ipe_new_policy.
> > + *
> > + * Return:
> > + * * !IS_ERR   - OK
> > + * * -ENOENT   - Policy doesn't exist
> > + * * -EINVAL   - New policy is invalid
> > + */
> > +struct ipe_policy *ipe_update_policy(struct ipe_policy __rcu **addr,
> > +                                    const char *text, size_t textlen,
> > +                                    const char *pkcs7, size_t pkcs7len)
> > +{
> > +       int rc = 0;
> > +       struct ipe_policy *old, *new;
> > +
> > +       old = ipe_get_policy_rcu(*addr);
> > +       if (!old) {
> > +               rc = -ENOENT;
> > +               goto err;
> > +       }
> > +
> > +       new = ipe_new_policy(text, textlen, pkcs7, pkcs7len);
> > +       if (IS_ERR(new)) {
> > +               rc = PTR_ERR(new);
> > +               goto err;
> > +       }
> > +
> > +       if (strcmp(new->parsed->name, old->parsed->name)) {
> > +               rc = -EINVAL;
> > +               goto err;
> > +       }
> > +
> > +       if (ver_to_u64(old) > ver_to_u64(new)) {
> > +               rc = -EINVAL;
> > +               goto err;
> > +       }
> > +
> > +       if (ipe_is_policy_active(old)) {
> 
> I don't understand the is-active check, you want to make @new the new
> active policy regardless, right?  Could this is-active check ever be
> false?
> 

Actually this is needed. Policy updates can be applied to any deployed
policy, which may be saved in two places: the securityfs file node
and the ipe_active_policy pointer. To update a policy, this function first
checks if the policy saved in the securityfs file node is currently active.
If so, it updates the ipe_active_policy pointer to point to the new policy,
and finally updates the policy pointer in the securityfs to the new policy.

-Fan

> > +               spin_lock(&ipe_policy_lock);
> > +               rcu_assign_pointer(ipe_active_policy, new);
> > +               spin_unlock(&ipe_policy_lock);
> > +               synchronize_rcu();
> > +       }
> > +
> > +       rcu_assign_pointer(*addr, new);
> > +
> > +       swap(new->policyfs, old->policyfs);
> > +       ipe_free_policy(old);
> > +
> > +       goto out;
> > +err:
> > +       ipe_free_policy(new);
> > +out:
> > +       return (rc < 0) ? ERR_PTR(rc) : new;
> > +}
> > +
> >  /**
> >   * ipe_new_policy - Allocate and parse an ipe_policy structure.
> >   *
> > @@ -117,3 +209,46 @@ struct ipe_policy *ipe_get_policy_rcu(struct ipe_policy __rcu *p)
> >
> >         return rv;
> >  }
> > +
> > +/**
> > + * ipe_set_active_pol - Make @p the active policy.
> > + * @p: Supplies a pointer to the policy to make active.
> > + */
> > +int ipe_set_active_pol(const struct ipe_policy *p)
> > +{
> > +       int rc = 0;
> > +       struct ipe_policy *ap = NULL;
> > +
> > +       ap = ipe_get_policy_rcu(ipe_active_policy);
> > +       if (ap && ver_to_u64(ap) > ver_to_u64(p)) {
> > +               rc = -EINVAL;
> > +               goto out;
> > +       }
> > +
> > +       spin_lock(&ipe_policy_lock);
> > +       rcu_assign_pointer(ipe_active_policy, p);
> > +       spin_unlock(&ipe_policy_lock);
> > +       synchronize_rcu();
> > +
> > +out:
> > +       return rc;
> > +}
> > +
> > +/**
> > + * ipe_is_policy_active - Determine wehther @p is the active policy.
> > + * @p: Supplies a pointer to the policy to check.
> > + *
> > + * Return:
> > + * * true      - @p is the active policy
> > + * * false     - @p is not the active policy
> > + */
> > +bool ipe_is_policy_active(const struct ipe_policy *p)
> > +{
> > +       bool rv;
> > +
> > +       rcu_read_lock();
> > +       rv = rcu_access_pointer(ipe_active_policy) == p;
> > +       rcu_read_unlock();
> > +
> > +       return rv;
> > +}
> 
> --
> paul-moore.com

--
Linux-audit mailing list
Linux-audit@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-audit

