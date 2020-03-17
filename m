Return-Path: <linux-audit-bounces@redhat.com>
X-Original-To: lists+linux-audit@lfdr.de
Delivered-To: lists+linux-audit@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id D3721188F1A
	for <lists+linux-audit@lfdr.de>; Tue, 17 Mar 2020 21:37:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584477470;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IkQUpXEXKqWESBF+Ck9+8xhj0NxllpWAVH9/DcHx2Ao=;
	b=ZjZKdnS+sTj4arGDzl0hbva0pLYcWv5ulpOKDfssBxP5OXDpovFZgR+vKdSuCLhbLH5Vzh
	+OIehLGIyXrdmxlbgFcGRocU4ZGJzC2t3yD2VMUZzLGGYZac4IVvy/DWtbqmoFlQDxg3z0
	jowtbjEX00MNyS7QhAdLzJHKGZQND14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-oBRqn6nTMAapJQ2nGL1c4A-1; Tue, 17 Mar 2020 16:37:48 -0400
X-MC-Unique: oBRqn6nTMAapJQ2nGL1c4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F28A9800D53;
	Tue, 17 Mar 2020 20:37:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB1675D9E2;
	Tue, 17 Mar 2020 20:37:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60446860FE;
	Tue, 17 Mar 2020 20:37:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02HKbRKY017926 for <linux-audit@listman.util.phx.redhat.com>;
	Tue, 17 Mar 2020 16:37:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BFB6E12254C; Tue, 17 Mar 2020 20:37:27 +0000 (UTC)
Delivered-To: linux-audit@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA03511E1E8
	for <linux-audit@redhat.com>; Tue, 17 Mar 2020 20:37:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 950338007D9
	for <linux-audit@redhat.com>; Tue, 17 Mar 2020 20:37:25 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-139-65Nf9l9xMqmjOBprPw9nXQ-1; Tue, 17 Mar 2020 16:37:16 -0400
X-MC-Unique: 65Nf9l9xMqmjOBprPw9nXQ-1
Received: by mail-ed1-f68.google.com with SMTP id v6so13123061edw.8
	for <linux-audit@redhat.com>; Tue, 17 Mar 2020 13:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qNuRt4M1sA+VTMu9Z2RL07UFEQt4FiXIpn7ctEFGeuc=;
	b=SuNTCOqHO86KyvNYgqrRBVtVFyHwPRX7vb3w6XTfpzQALdRA6LUklK65Tqjscmz2dl
	lxTx8QIVU05tC89pYImhG0boQMoNNaV3s1itWsZ1B5wcaDvTJum4sbPNhgd0fZWi5hJ/
	zKMehuGQXZgaPshdx/rxcp3ag8FMh9uGD1y8vuOf5v/GJPQxwBWKhKCIQB1V5mc44rz1
	NM2dpXD9f8jpljfoyrZueBsQjIQKnLTb9uHRHm37d1+mKqW3MsP6HThfdk/NnbYrKlim
	8KwTVXWxjMxZ99iXIjle8tpwEFEVA62O609xDdnsInv0vuFn1uqYWCaMCfUrM33XrVXY
	kbyQ==
X-Gm-Message-State: ANhLgQ0YKrTjGjN6tQHbgbVLer450ShiN1VMxZjpMyybSubsvYw/usFr
	3QLkEz6PFy6sJD/evmw+Hq7MnoBl+/hZ+6anZR89
X-Google-Smtp-Source: ADFU+vvl7/5iUodUkOOZC72uaxTQTAnYIlZ1f5Ew8lZq77zhlyK9p1emRCEJxojvOdhn9Tv7D8FF9DVg0rC8x3YAg4c=
X-Received: by 2002:aa7:cf93:: with SMTP id z19mr593289edx.12.1584477435522;
	Tue, 17 Mar 2020 13:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <158257989798.399121.1279697192021117003.stgit@chester>
	<20200317191348.ta2wvakbuxq7xxel@madcap2.tricolour.ca>
In-Reply-To: <20200317191348.ta2wvakbuxq7xxel@madcap2.tricolour.ca>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 17 Mar 2020 16:37:04 -0400
Message-ID: <CAHC9VhQRTuOViwWNAyTEBtHV5vUtZPKHB8wQznJ_xnTm_-fQBA@mail.gmail.com>
Subject: Re: [PATCH] audit: fix error handling in audit_data_to_entry()
To: Richard Guy Briggs <rgb@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02HKbRKY017926
X-loop: linux-audit@redhat.com
Cc: linux-audit@redhat.com
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

On Tue, Mar 17, 2020 at 3:14 PM Richard Guy Briggs <rgb@redhat.com> wrote:
> On 2020-02-24 16:31, Paul Moore wrote:
> > Commit 219ca39427bf ("audit: use union for audit_field values since
> > they are mutually exclusive") combined a number of separate fields in
> > the audit_field struct into a single union.  Generally this worked
> > just fine because they are generally mutually exclusive.
> > Unfortunately in audit_data_to_entry() the overlap can be a problem
> > when a specific error case is triggered that causes the error path
> > code to attempt to cleanup an audit_field struct and the cleanup
> > involves attempting to free a stored LSM string (the lsm_str field).
> > Currently the code always has a non-NULL value in the
> > audit_field.lsm_str field as the top of the for-loop transfers a
> > value into audit_field.val (both .lsm_str and .val are part of the
> > same union); if audit_data_to_entry() fails and the audit_field
> > struct is specified to contain a LSM string, but the
> > audit_field.lsm_str has not yet been properly set, the error handling
> > code will attempt to free the bogus audit_field.lsm_str value that
> > was set with audit_field.val at the top of the for-loop.
> >
> > This patch corrects this by ensuring that the audit_field.val is only
> > set when needed (it is cleared when the audit_field struct is
> > allocated with kcalloc()).  It also corrects a few other issues to
> > ensure that in case of error the proper error code is returned.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 219ca39427bf ("audit: use union for audit_field values since they are mutually exclusive")
> > Reported-by: syzbot+1f4d90ead370d72e450b@syzkaller.appspotmail.com
> > Signed-off-by: Paul Moore <paul@paul-moore.com>
> > ---
> >  kernel/auditfilter.c |   71 +++++++++++++++++++++++++++-----------------------
> >  1 file changed, 39 insertions(+), 32 deletions(-)
> >
> > diff --git a/kernel/auditfilter.c b/kernel/auditfilter.c
> > index b0126e9c0743..026e34da4ace 100644
> > --- a/kernel/auditfilter.c
> > +++ b/kernel/auditfilter.c
> > @@ -456,6 +456,7 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
> >       bufp = data->buf;
> >       for (i = 0; i < data->field_count; i++) {
> >               struct audit_field *f = &entry->rule.fields[i];
> > +             u32 f_val;
> >
> >               err = -EINVAL;
> >
> > @@ -464,12 +465,12 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
> >                       goto exit_free;
> >
> >               f->type = data->fields[i];
> > -             f->val = data->values[i];
> > +             f_val = data->values[i];
> >
> >               /* Support legacy tests for a valid loginuid */
> > -             if ((f->type == AUDIT_LOGINUID) && (f->val == AUDIT_UID_UNSET)) {
> > +             if ((f->type == AUDIT_LOGINUID) && (f_val == AUDIT_UID_UNSET)) {
> >                       f->type = AUDIT_LOGINUID_SET;
> > -                     f->val = 0;
> > +                     f_val = 0;
> >                       entry->rule.pflags |= AUDIT_LOGINUID_LEGACY;
> >               }
> >
> > @@ -485,7 +486,7 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
> >               case AUDIT_SUID:
> >               case AUDIT_FSUID:
> >               case AUDIT_OBJ_UID:
> > -                     f->uid = make_kuid(current_user_ns(), f->val);
> > +                     f->uid = make_kuid(current_user_ns(), f_val);
> >                       if (!uid_valid(f->uid))
> >                               goto exit_free;
> >                       break;
> > @@ -494,11 +495,12 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
> >               case AUDIT_SGID:
> >               case AUDIT_FSGID:
> >               case AUDIT_OBJ_GID:
> > -                     f->gid = make_kgid(current_user_ns(), f->val);
> > +                     f->gid = make_kgid(current_user_ns(), f_val);
> >                       if (!gid_valid(f->gid))
> >                               goto exit_free;
> >                       break;
> >               case AUDIT_ARCH:
> > +                     f->val = f_val;
> >                       entry->rule.arch_f = f;
> >                       break;
> >               case AUDIT_SUBJ_USER:
> > @@ -511,11 +513,13 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
> >               case AUDIT_OBJ_TYPE:
> >               case AUDIT_OBJ_LEV_LOW:
> >               case AUDIT_OBJ_LEV_HIGH:
> > -                     str = audit_unpack_string(&bufp, &remain, f->val);
> > -                     if (IS_ERR(str))
> > +                     str = audit_unpack_string(&bufp, &remain, f_val);
> > +                     if (IS_ERR(str)) {
> > +                             err = PTR_ERR(str);
> >                               goto exit_free;
> > -                     entry->rule.buflen += f->val;
> > -
> > +                     }
> > +                     entry->rule.buflen += f_val;
> > +                     f->lsm_str = str;
> >                       err = security_audit_rule_init(f->type, f->op, str,
> >                                                      (void **)&f->lsm_rule);
> >                       /* Keep currently invalid fields around in case they
> > @@ -524,68 +528,71 @@ static struct audit_entry *audit_data_to_entry(struct audit_rule_data *data,
> >                               pr_warn("audit rule for LSM \'%s\' is invalid\n",
> >                                       str);
> >                               err = 0;
> > -                     }
> > -                     if (err) {
> > -                             kfree(str);
> > +                     } else if (err)
>
> If there is an error from security_audit_rule_init() other than -EINVAL
> (which could become valid after a policy reload), would the str passed
> to it not need to be freed before we goto exit_free?

After audit_unpack_string() succeeds we store "str" in the audit_field
struct which should be cleaned up by audit_free_rule() when we jump to
exit_free.

> >                               goto exit_free;
> > -                     } else
> > -                             f->lsm_str = str;
> >                       break;
> >               case AUDIT_WATCH:
> > -                     str = audit_unpack_string(&bufp, &remain, f->val);
> > -                     if (IS_ERR(str))
> > +                     str = audit_unpack_string(&bufp, &remain, f_val);
> > +                     if (IS_ERR(str)) {
> > +                             err = PTR_ERR(str);
> >                               goto exit_free;
> > -                     entry->rule.buflen += f->val;
> > -
> > -                     err = audit_to_watch(&entry->rule, str, f->val, f->op);
> > +                     }
> > +                     err = audit_to_watch(&entry->rule, str, f_val, f->op);
> >                       if (err) {
> >                               kfree(str);
> >                               goto exit_free;
> >                       }
> > +                     entry->rule.buflen += f_val;
> >                       break;
> >               case AUDIT_DIR:
> > -                     str = audit_unpack_string(&bufp, &remain, f->val);
> > -                     if (IS_ERR(str))
> > +                     str = audit_unpack_string(&bufp, &remain, f_val);
> > +                     if (IS_ERR(str)) {
> > +                             err = PTR_ERR(str);
> >                               goto exit_free;
> > -                     entry->rule.buflen += f->val;
> > -
> > +                     }
> >                       err = audit_make_tree(&entry->rule, str, f->op);
> >                       kfree(str);
> >                       if (err)
> >                               goto exit_free;
> > +                     entry->rule.buflen += f_val;
> >                       break;
> >               case AUDIT_INODE:
> > +                     f->val = f_val;
> >                       err = audit_to_inode(&entry->rule, f);
> >                       if (err)
> >                               goto exit_free;
> >                       break;
> >               case AUDIT_FILTERKEY:
> > -                     if (entry->rule.filterkey || f->val > AUDIT_MAX_KEY_LEN)
> > +                     if (entry->rule.filterkey || f_val > AUDIT_MAX_KEY_LEN)
> >                               goto exit_free;
> > -                     str = audit_unpack_string(&bufp, &remain, f->val);
> > -                     if (IS_ERR(str))
> > +                     str = audit_unpack_string(&bufp, &remain, f_val);
> > +                     if (IS_ERR(str)) {
> > +                             err = PTR_ERR(str);
> >                               goto exit_free;
> > -                     entry->rule.buflen += f->val;
> > +                     }
> > +                     entry->rule.buflen += f_val;
> >                       entry->rule.filterkey = str;
> >                       break;
> >               case AUDIT_EXE:
> > -                     if (entry->rule.exe || f->val > PATH_MAX)
> > +                     if (entry->rule.exe || f_val > PATH_MAX)
> >                               goto exit_free;
> > -                     str = audit_unpack_string(&bufp, &remain, f->val);
> > +                     str = audit_unpack_string(&bufp, &remain, f_val);
> >                       if (IS_ERR(str)) {
> >                               err = PTR_ERR(str);
> >                               goto exit_free;
> >                       }
> > -                     entry->rule.buflen += f->val;
> > -
> > -                     audit_mark = audit_alloc_mark(&entry->rule, str, f->val);
> > +                     audit_mark = audit_alloc_mark(&entry->rule, str, f_val);
> >                       if (IS_ERR(audit_mark)) {
> >                               kfree(str);
> >                               err = PTR_ERR(audit_mark);
> >                               goto exit_free;
> >                       }
> > +                     entry->rule.buflen += f_val;
> >                       entry->rule.exe = audit_mark;
> >                       break;
> > +             default:
> > +                     f->val = f_val;
> > +                     break;
> >               }
> >       }

-- 
paul moore
www.paul-moore.com


--
Linux-audit mailing list
Linux-audit@redhat.com
https://www.redhat.com/mailman/listinfo/linux-audit

